# Maintainer: Daniel Leining <daniel@the-beach.co>
# Old Maintainer: Lakota Morris <lakota[at]lakotamorris[dot]com>
pkgname=chunky
pkgver=1.3.1
basever=1.3
pkgrel=2
pkgdesc="Chunky is a Minecraft mapping and rendering tool created by Jesper Öqvist."
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-runtime')
makedepends=('apache-ant' 'gendesk' 'unzip')
source=(https://launchpad.net/"$pkgname"/"$basever"/"$pkgver"/+download/Chunky-"$pkgver".zip
       chunky.sh)
noextract=(Chunky-"$pkgver".zip)
md5sums=('b3b2fba4baa7971d3ae5cee264ce765e'
         '3ca19939c7ef56f7768bd6db66b1ecf8')

build() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  unzip -o -q Chunky-"$pkgver".zip chunky.jar
  unzip -o -q chunky.jar chunky-cfg.png
}

package() {
  install -Dm755 chunky.sh "$pkgdir/usr/bin/chunky"
  install -Dm644 chunky.jar "$pkgdir/usr/share/java/chunky.jar"
  install -Dm644 chunky.desktop "$pkgdir/usr/share/applications/chunky.desktop"
  install -Dm644 chunky-cfg.png "$pkgdir/usr/share/pixmaps/chunky.png"
}
