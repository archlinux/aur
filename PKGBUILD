# Maintainer: Tomáš Mládek <tmladek{at}inventati{dot}org>
pkgname=fortune-mod-hyakunin-isshu
pkgver=1.0
pkgrel=2
pkgdesc="Fortune cookies: Ogura Hyakunin Isshu poems"
url="http://jti.lib.virginia.edu/japanese/hyakunin/index.html"
arch=('any')
license=('public-domain')
depends=('fortune-mod')
source=("http://jti.lib.virginia.edu/japanese/hyakunin/frames/index/hyaku1eng.html")
md5sums=('a3f5bfe7c1867f094485b2908a8a1e1c')

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
