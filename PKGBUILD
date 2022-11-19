# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python38-click
_realname=click
pkgver=8.1.3
pkgrel=1
pkgdesc="Simple wrapper around optparse for powerful command line utilities"
arch=("any")
url='https://click.palletsprojects.com/'
license=("BSD")
depends=("python38")
makedepends=('python38-setuptools' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest')
source=("https://github.com/pallets/click/archive/${pkgver}/$pkgname-$pkgver.tar.gz")
sha512sums=('29194ee3877e013a2fe1037870522c5b5a78136ca60da9109f29312a3e52c767867f5eec2d90ca385cd0508f77555b9d6ad8f5141dc31900ddc9307a2207a818')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PYTHONPATH="build/lib" pytest
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "LICENSE.rst" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
