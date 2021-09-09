# Maintainer: Benjamin Gallois <benjamin.gallois at fasttrack dot sh>
pkgbase=fasttrack
pkgname=(fasttrack fasttrack-cli)
pkgver=5.3.4
pkgrel=1
pkgdesc='Multiple objects tracking software, easy to use, and performant.'
arch=(any)
url='https://www.fasttrack.sh'
license=(GPL3)
groups=()
depends=('opencv>=4.0.0' qt5-base qt5-webengine gcc-libs)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/FastTrackOrg/FastTrack/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d3071435e0c92a1b174ee44855ec087fbfccdcbcffc3489d51b5310c02e7c1f5')

prepare() {
  mv "FastTrack-$pkgver" "$pkgbase-$pkgver"
}

build() {
  cd "$pkgbase-$pkgver"
  ./run.sh ci
  ./run.sh cli
}

package_fasttrack() {
  cd "$pkgbase-$pkgver"
  install -D build/fasttrack -t "$pkgdir"/usr/bin/
  install -D sh.fasttrack.fasttrack.desktop -t "$pkgdir"/usr/share/applications/
  install -D sh.fasttrack.fasttrack.metainfo.xml -t "$pkgdir"/usr/share/metainfo/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -D src/assets/icon.png "$pkgdir"/usr/share/icons/fasttrack.png
}

package_fasttrack-cli() {
  cd "$pkgbase-$pkgver"
  install -D build_cli/fasttrack-cli "$pkgdir"/usr/bin/fasttrack-cli
}
