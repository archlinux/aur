# Maintainer: Prelat Vincent <prelatv@gmail.com>

pkgname=megaraid-cli
pkgver=8.07.14
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards, also works with some Dell PERC RAID cards."
arch=('i686' 'x86_64')
url="http://www.lsi.com"
license=('custom')
depends=()
makedepends=('rpmextract')
source=('passeula.html::http://www.lsi.com/magic.axd?x=e&file=http%3A//www.lsi.com/downloads/Public/RAID%2520Controllers/MegaRAID%2520Common%2520Files/'${pkgver}'_MegaCLI.zip' \
        'http://www.lsi.com/downloads/Public/RAID%20Controllers/RAID%20Controllers%20Common%20Files/'${pkgver}'_MegaCLI.zip'
        'LICENSE')
install=megaraid-cli.install
md5sums=('350e9c94d15031eaba6bf07e7b241dae'
         'bf53eeb0e8ccc09c34f52d7035940c62'
         '7fc9029354d93a8d49ffba765908b0c4')

build() {
  cd "$srcdir"
  msg "Extracting files from RPM"
  rpmextract.sh Linux/MegaCli-${pkgver}-1.noarch.rpm
}

package() {
  install -d $pkgdir/opt/MegaRAID/MegaCli
  cp $srcdir/opt/MegaRAID/MegaCli/* $pkgdir/opt/MegaRAID/MegaCli
  case $CARCH in
    'i686')
        rm $pkgdir/opt/MegaRAID/MegaCli/MegaCli64
        ;;
    'x86_64')
        rm $pkgdir/opt/MegaRAID/MegaCli/MegaCli
        mv $pkgdir/opt/MegaRAID/MegaCli/MegaCli64 $pkgdir/opt/MegaRAID/MegaCli/MegaCli
        ;;
  esac
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
