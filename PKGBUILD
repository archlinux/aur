# Contributor: johnnybash <georgpfahler@wachenzell.org>
# Contributor: r20d20 <r20d20@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Square252 <square@0xfc.de>
# Maintainer: Harvey <harv at gmx dot de>

pkgname=jameica-nightly
pkgver=2.11.0
pkgrel=5
pkgdesc="Free Java application platform"
arch=('x86_64')
url="http://www.willuhn.de/products/jameica/"
license=('GPL2')
depends=('java-runtime>=17' 'gtk3')
optdepends=('webkit2gtk-4.1: Required for mashup plugin used as new scripting platform for non-HBCI accounts (credit cards etc)'
			'java-jce_ustrength: Required for mashup plugin used as new scripting platform for non-HBCI accounts (credit cards etc)')
makedepends=('unzip')
conflicts=('jameica')
source=("http://www.willuhn.de/products/jameica/releases/nightly/jameica-linux64-$pkgver-nightly.zip" "jameica.desktop")
sha256sums=('SKIP'
            'b0221e7463407243d2922107d0de4c437e2037ab0639e2961c443db4f15725fc')

package() {
  install -d "$pkgdir"/usr/share/{java/jameica,applications}
  cp -R "$srcdir"/jameica "$pkgdir"/usr/share/java
  ln -s /usr/share/java/jameica/jameica-linux64.jar \
    "$pkgdir"/usr/share/java/jameica/jameica-linux.jar
  # edit startscript to export X11 also in case of wayland use
  # sed -i '22a # use X11 instead of wayland!\nexport GDK_BACKEND=x11\n' "$pkgdir"/usr/share/java/jameica/jameica.sh
  # edit startscript to support hidpi scaling
  sed -i 's|-Djava.net.preferIPv4Stack|-Dswt.autoScale -Djava.net.preferIPv4Stack|g' "$pkgdir"/usr/share/java/jameica/jameica.sh
  install -m 644 "$srcdir"/jameica.desktop "$pkgdir"/usr/share/applications
}
