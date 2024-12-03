# Maintainer: Richard Garber <rg.1029384756@gmail.com>

pkgname=yaacs
pkgver=1.3.5
pkgrel=1
pkgdesc="Convert your Audiobooks to Opus in parallel"
url="https://github.com/rgarber11/yaacs"
arch=('any')
license=(MIT)
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python>=3.9' 'opustags' 'mkvtoolnix-cli' 'ffmpeg' 'python-packaging')

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d84318d5d4eede43c8b8d2c599a9df9b7232882a50a34027463e5bcfb1750b9c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
