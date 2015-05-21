# Maintainer: Daniel Leining <daniel@the-beach.co>
# Old Maintainer: Lakota Morris <lakota[at]lakotamorris[dot]com>
pkgname=chunky
pkgver=1.3.5
basever=1.3
pkgrel=1
pkgdesc="Chunky is a Minecraft mapping and rendering tool created by Jesper Öqvist."
url="http://chunky.llbit.se/"
arch=('any')
license=('GPL3')
depends=('java-runtime')
makedepends=('apache-ant' 'gendesk' 'unzip')
source=(https://launchpad.net/"$pkgname"/"$basever"/"$pkgver"/+download/Chunky-"$pkgver".zip
       chunky.sh)
noextract=(Chunky-"$pkgver".zip)
sha256sums=('728e21d384d38d7038d2a1372b3fe45627b9ef913fd1ae5f22a3210328eadaf3'
            '73389b938eaaf1eeac656a762fe16fab68e89ab499d11ac8427e2177a5059c57')

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
