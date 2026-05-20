# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Elias Werberich <elias@werberich.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.br>

pkgname=python-pyro5
pkgver=5.16
pkgrel=1
pkgdesc='Remote objects communication library'
arch=(any)
url="https://github.com/irmen/Pyro5/"
license=(MIT)
depends=('python'
         'python-greenlet'
         'python-serpent')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('python-msgpack: alternate serializer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7e58547b9cccd729854d50bee6f262776cbbd7ef03b8d2d1f0dbd8d28504d5db')

build() {
	cd "Pyro5-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "Pyro5-$pkgver"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dvm644 Readme.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
