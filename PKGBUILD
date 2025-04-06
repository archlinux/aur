# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rtcqs
pkgdesc='Scanner for potential real-time bottlenecks'
pkgver=0.6.5
pkgrel=1
arch=(any)
url='https://codeberg.org/rtcqs/rtcqs'
license=(MIT)
depends=(hicolor-icon-theme python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/rtcqs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('826301e06da9b42466ab3cd15b3b98fcc8c30fd9026ef2c196c28bbab844b97a')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -vDm644 ${pkgname}_logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
}
