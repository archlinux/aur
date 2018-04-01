# Maintainer: Daniel Leining <daniel@the-beach.co>

pkgname=chunky
pkgver=1.4.5
basever=1.4
pkgrel=1
pkgdesc="Minecraft mapping and rendering tool"
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-runtime-openjdk=8' 'java-openjfx')
makedepends=('gendesk')
source=(https://launchpad.net/"$pkgname"/"$basever"/"$pkgver"/+download/Chunky-"$pkgver".zip
       chunky.sh)
sha512sums=('2b583066a0dffecf117e0feb1aa4b422079e14aca3120cf4ce357fd8b2c2b6739806123d5bb53e065727e4abab4d41b82b7f47c626c7ce54a3282d4c97a4246a'
            '180f6110c93ec58d5b0d42e7c9c5de3e00b8003dc90b0d81c10a25bff98dd4233f2b1861d0814c4695247998cb8a98ec622f4a91ef9b7fd709ea950db8784fff')

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
