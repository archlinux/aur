# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: redtide <redtid3 -at- gmail -dot- com>

_name=ConvertWithMoss
pkgname=${_name,,}
pkgver=8.0.0
pkgrel=2
pkgdesc='A tool for converting multi-samples from one format to another'
url='https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html'
arch=(aarch64 x86_64)
license=(LGPL-3.0-only)
depends=('java-runtime>=16')
makedepends=(maven)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('45b12cc8281feb50837d32b4c22bdf22e99b91a8d07dd666e761ea31e7db4f7e')

build() {
  cd $_name-$pkgver
  mvn -Dproject.build.outputTimestamp=$SOURCE_DATE_EPOCH clean install
}

package() {
  cd $_name-$pkgver
  install -Dm644 target/lib/*.jar -t "$pkgdir"/usr/share/$_name
  ln -sf $pkgname-$pkgver.jar "$pkgdir"/usr/share/$_name/$pkgname.jar
  install -Dm644 linux/de.mossgrabers.$_name.desktop \
    -t "$pkgdir"/usr/share/applications
  install -Dm644 linux/de.mossgrabers.$_name.appdata.xml \
    -t "$pkgdir"/usr/share/metainfo
  install -Dm644 icons/$pkgname.png -t "$pkgdir"/usr/share/pixmaps
  install -Dm755 linux/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
