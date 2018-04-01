# Maintainer: Daniel Leining <daniel@the-beach.co>

pkgname=chunky
pkgver=1.4.4
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
sha512sums=('ba2ea8ab5b5b56f08dff890353d39b1cfdaa456888e03e44708473d7403891960aa233a4abf2beb98425b09d1a41bb00ed5ecb6758c2b44c67c4a99ebb604941'
            '69827c1468e91da782e7260be9b7dab8b415c0d95f4b1286b809b63039bd07cdf06a9b8dd99a509f85145547015e0676fa6868e4ead6ff14bd0e49de82cec9fc')

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
