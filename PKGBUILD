# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-client
pkgver=7.2.0
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
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-setuptools-changelog-shortener')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c143368458c3878ba7bee6a1d9b418e2e659571a3856614f58d76b8a28269d7b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
