# Maintainer: Daniel Leining <daniel@the-beach.co>

pkgname=chunky
pkgver=1.4.0
basever=1.4
pkgrel=1
pkgdesc="Minecraft mapping and rendering tool"
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-environment' 'java-openjfx')
makedepends=('gendesk')
source=(https://launchpad.net/"$pkgname"/"$basever"/"$pkgver"/+download/Chunky-"$pkgver".zip
       chunky.sh)
sha256sums=('81442706272a84caf6fa1ea9b814529024c65dd696982022d58b2974016b97af'
            '73389b938eaaf1eeac656a762fe16fab68e89ab499d11ac8427e2177a5059c57')

build() {
  gendesk -f -n

  bsdtar -xf chunky-$pkgver.jar --strip-components 1 lib/chunky-core-$pkgver.jar
  bsdtar -xf chunky-core-$pkgver.jar chunky-icon.png
}

package() {
  install -Dm755 chunky.sh "$pkgdir/usr/bin/chunky"
  install -Dm644 chunky-$pkgver.jar "$pkgdir/usr/share/java/chunky-$pkgver.jar"
  install -Dm644 chunky.desktop "$pkgdir/usr/share/applications/chunky.desktop"
  install -Dm644 chunky-icon.png "$pkgdir/usr/share/pixmaps/chunky.png"
  ln -s chunky-$pkgver.jar "$pkgdir/usr/share/java/chunky.jar"
}
