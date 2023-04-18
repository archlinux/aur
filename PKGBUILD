# Maintainer: Guten Ye <ywzhaifei at gmail dot com>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>
# Contributor: Paulo Ouverney <ph.ouverney at gmail dot com>

pkgname=exodus
pkgver=23.4.10
pkgrel=1
pkgdesc="Send, receive & exchange cryptocurrency with ease on the world's leading Desktop, Mobile and Hardware wallets. Bitcoin wallet"
arch=('x86_64')
url="https://exodus.com"
license=('custom')
depends=('libxss')
source=("https://downloads.exodus.com/releases/exodus-linux-x64-${pkgver}.zip"
	"${pkgname}.svg"
	"${pkgname}.desktop"
        "LICENSE")
sha256sums=('14ff2dc3ed23f371cde670f5162f7883e93c759636e9946a413ff762dd4b7f1a'
            'ffafdcd0869f1c9338ba25e447698c4cfa3c8714123459ae3e63686a5312ef2e'
            '04676d81272a35a91150a7eec4640e69ca50f2e479d29fad8be90160ee74122c'
            '582d6782c9412cd961c55d105f38ed5c911bf8509be040b8d23a836504a25d0b')

package() {
  cd $srcdir/Exodus-linux-x64

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{LICENSE*,version}
  ln -s /opt/$pkgname/Exodus $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Icons
  install -Dm644 $srcdir/$pkgname.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

  # License
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod -R ugo+rX $pkgdir/opt
}
