# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rtcqs
pkgdesc='Scanner for potential real-time bottlenecks'
pkgver=0.6.7
pkgrel=2
arch=(any)
url='https://codeberg.org/rtcqs/rtcqs'
license=(MIT)
depends=(hicolor-icon-theme python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-freesimplegui: for rtcqs_gui GUI program')
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/rtcqs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4b4431f2377f5f6b151856c154daf1e4d024a4d801da7aca722972e01b2c926b')

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
