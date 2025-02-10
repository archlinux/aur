# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
# Co-Maintainer: Stephanie Wilde-Hobbs <arch at stephanie dot is>
pkgname=nanovna-saver
pkgver=0.7.1
pkgrel=1
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/NanoVNA-Saver/nanovna-saver"
license=('GPL3')
depends=(pyside6 python-scipy python-numpy python-pyserial)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm pyside6-tools-wrappers)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/NanoVNA-Saver/nanovna-saver/archive/v$pkgver.tar.gz"
)
sha256sums=('c8f89fcdbe94e623c478d17187fe166d58458cb6875120e7bc002f6e00452bea')

build() {
  cd "$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NANOVNASAVER="${pkgver}" \
    python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp NanoVNASaver_48x48.png "$pkgdir/usr/share/pixmaps/"

  mkdir -p "$pkgdir/usr/share/applications"
  cp NanoVNASaver.desktop "$pkgdir/usr/share/applications"
}
