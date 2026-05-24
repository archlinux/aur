# Maintainer: Damien Lebond <damienlebond@onionmail.org>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>
# Contributor: Paulo Ouverney <ph.ouverney at gmail dot com>

pkgname=exodus-bin
pkgver=26.5.7
pkgrel=2
pkgdesc="Send, receive & exchange cryptocurrency with ease on the world's leading Desktop, Mobile and Hardware wallets. Bitcoin wallet"
arch=('x86_64')
url="https://exodus.com"
license=('custom')
depends=(npm
         libxss)
DLAGENTS=("https::/usr/bin/curl --user-agent 'exodus-archlinux-pkg' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://downloads.exodus.com/releases/exodus-linux-x64-${pkgver}.zip"
	"exodus.svg::https://aur.archlinux.org/cgit/aur.git/plain/exodus.svg?h=exodus"
	"exodus.desktop::https://aur.archlinux.org/cgit/aur.git/plain/exodus.desktop?h=exodus"
	"LICENSE::https://aur.archlinux.org/cgit/aur.git/plain/LICENSE?h=exodus")
sha256sums=('66ce0aa2e74eb44c7e08f335a521cf6f113186c1637c0dee51662a70f8b4eeb9'
            'ffafdcd0869f1c9338ba25e447698c4cfa3c8714123459ae3e63686a5312ef2e'
            '04676d81272a35a91150a7eec4640e69ca50f2e479d29fad8be90160ee74122c'
            '582d6782c9412cd961c55d105f38ed5c911bf8509be040b8d23a836504a25d0b')

package() {
  cd $srcdir/Exodus-linux-x64

  install -d $pkgdir/{opt/exodus,usr/bin}
  cp -a * $pkgdir/opt/exodus
  rm $pkgdir/opt/exodus/{LICENSE*,version}
  ln -s /opt/$exodus/Exodus $pkgdir/usr/bin/exodus
  
  # Launcher
  install -Dm644 $srcdir/exodus.desktop $pkgdir/usr/share/applications/exodus.desktop

  # Icons
  install -Dm644 $srcdir/exodus.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/exodus.svg

  # License
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/exodus/LICENSE"

  chmod -R ugo+rX $pkgdir/opt
}
