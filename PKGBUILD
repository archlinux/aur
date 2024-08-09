# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-client
_pkgname=devpi_client
pkgver=7.1.0
pkgrel=1
pkgdesc="Workflow commands for Python developers"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=(
  'check-manifest'
  'devpi-common'
  'python-build'
  'python-iniconfig'
  'python-pkginfo'
  'python-platformdirs'
  'python-pluggy'
  'python-py')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-setuptools-changelog-shortener')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3706e1ae88f13894a90ef324d0c6c01826e3992f33da0d729d6eb3ce056fcbf3')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
