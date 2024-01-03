# Contributor: Steff <archuserrepository at gmx dot de>
# Contributor: Felix <flx.bier at googlemail dot com>

pkgname=dudenbib
pkgver=6.4.0
pkgrel=1	
arch=('i686' 'x86_64')
pkgdesc="Utility to view books from Duden, Brockhaus and some others"
url="http://www.duden.de/deutsche_sprache/index.php?nid=185"
license=('custom:dudenbib')
install=duden.install
depends=('libxmu' 'libxft' 'libxcursor' 'libxrandr' 'gcc-libs' 'libxi' 'libxinerama' 'libxcb')

if [ "$CARCH" = "x86_64" ]; then
  for i in ${!depends[*]}; do depends[$i]="lib32-"${depends[$i]}; done
fi
FILE="dudenbibliothek6_6.4.0.7_amd64.deb"
source=("https://cdn.duden.de/downloads/proxy/2001_duden_bibliothek-update-6.4/$FILE")
noextract=("$FILE")
md5sums=('7d82bf1ebb715ab8be7d506998a3ec26')
package() {
  ar -x $FILE data.tar.zst control.tar.zst
  tar -xf data.tar.zst -C "$pkgdir"
  tar -xf control.tar.zst

  chmod -R 755 "${pkgdir}/opt"
  chmod -R 755 "${pkgdir}/usr"

  install -Dm755 "${srcdir}/postinst" "${pkgdir}/usr/share/dudenbib/postinst"
}

