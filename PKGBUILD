# Maintainer: Tomáš Mládek <t@mldk.cz>
pkgname=fortune-mod-hyakunin-isshu
pkgver=1.0
pkgrel=3
pkgdesc="Fortune cookies: Ogura Hyakunin Isshu poems"
url="http://jti.lib.virginia.edu/japanese/hyakunin/index.html"
arch=('any')
license=('public-domain')
depends=('fortune-mod')
source=("https://web.archive.org/web/20210315005425/http://jti.lib.virginia.edu/japanese/hyakunin/frames/index/hyaku1eng.html")
sha256sums=('109c3ee53819ed14141ca765e90d128ac5d68d19a04a4fe7f4d52c44fdb98d48')

build() {
  grep '^<br>' hyaku1eng.html|\
  grep -v '<\?center>'|\
  sed -re ':a;N;$!ba;s/<br>\n<br><br>( \| )?/%/g'|\
  sed -e 's/<br>//g' > hyakunin-isshu
 
  strfile hyakunin-isshu
}

package() {
  mkdir -p $pkgdir/usr/share/fortune
  cp hyakunin-isshu hyakunin-isshu.dat $pkgdir/usr/share/fortune
}
