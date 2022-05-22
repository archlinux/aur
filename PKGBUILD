# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=jcatgui-9kw
pkgver=1.3
pkgrel=1
pkgdesc='An application written to solve jobs or rather to earn credits on 9kw.eu in more comfortable way than in a browser.'
arch=('any')
url='https://github.com/midnite0/jcatgui9kw'
license=('unknown')
depends=('bash' 'java-runtime')
makedepends=('gendesk')
source=("https://github.com/midnite0/jcatgui9kw/releases/download/v$pkgver/JCatGUI_9kw.jar")
sha256sums=('e5baac588106f9d6307143b1654f1d7afe51c63d9cfde8e7dcd501cacc3ef4eb')

prepare() {
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories "Network;Scanning;OCR"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/$pkgname/JCatGUI_9kw.jar" > $pkgname.sh
}

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 JCatGUI_9kw.jar "$pkgdir/usr/share/java/$pkgname/JCatGUI_9kw.jar"
  install -Dm644 resources/logo/128.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
