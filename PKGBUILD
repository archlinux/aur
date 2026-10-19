# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rtcqs
pkgdesc='Scanner for potential real-time bottlenecks'
pkgver=0.6.7
pkgrel=3
arch=(any)
url='https://codeberg.org/rtcqs/rtcqs'
license=(MIT)
depends=(hicolor-icon-theme python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-freesimplegui: for rtcqs_gui GUI program')
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/rtcqs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('22bd9798c24e99351c259069e136b8683c211abc551775595cbacc3c8a19eae7')

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
