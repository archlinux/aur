# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=jcatgui-9kw
pkgver=1.2
pkgrel=1
pkgdesc='An application written to solve jobs or rather to earn credits on 9kw.eu in more comfortable way than in a browser.'
arch=('any')
url='https://sites.google.com/site/jcatgui9kw/'
license=('unknown')
depends=('bash' 'java-runtime')
makedepends=('gendesk')
source=("https://github.com/midnite0/jcatgui9kw/releases/download/v$pkgver/jCatGUI-$pkgver.zip")
sha256sums=('37e31ea14ddfd5d8e193deed2b16390443166a49fc6e204ddd85f6f9fb5ad1d9')

prepare() {
  bsdtar -xf jCatGUI_9kw.jar
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories "Network;Scanning;OCR"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/$pkgname/jCatGUI_9kw.jar" > $pkgname.sh
}

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 jCatGUI_9kw.jar "$pkgdir/usr/share/java/$pkgname/jCatGUI_9kw.jar"
  install -Dm644 resources/logo/128.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
