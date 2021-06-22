# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : Stefano Capitani <stefanoatmanjarodotorg>
# Contributor : lemovice <lemovice-at-ancestris-dot-org> 

pkgname="ancestris"
pkgver=11.20210529
pkgrel=1
pkgdesc="A genealogy program written in Java"
url="https://www.ancestris.org"
license=("GPL3")
arch=("any")
optdepends=("java-runtime=8: to use java 8"
            "java-runtime=10: to use java 10"
            "java-runtime=11: to use java 11") # java 16 doesn't seem to be supported
source=("https://www.ancestris.org/dl/pub/ancestris/releases/$pkgname-${pkgver/\.*/}-${pkgver/*\./}.deb")
sha256sums=('8da5fb5945473d0b4f0d1e4f6e6c301a4ba7ac1d05d80670fe93a8308f6ac76a')
backup=("etc/ancestris/ancestris.clusters" "etc/ancestris/ancestris.conf")
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # remove windows files
 find . -type f  \( -name "*.exe" -o -name "*.dll" \) -exec rm {} \;
 # copy program files
 cp -r "usr" "$pkgdir"
 # move configuration
 install -d "$pkgdir/etc"
 mv "$pkgdir/usr/share/ancestris/etc" "$pkgdir/etc/ancestris"
 ln -s "/etc/ancestris" "$pkgdir/usr/share/ancestris/etc"
}
