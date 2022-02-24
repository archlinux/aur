#ng/ Maintainer: Karol Babioch <karol@babioch.de>

pkgname=megacli
pkgver=8.07.14
pkgrel=3
pkgdesc='CLI program for LSI MegaRAID cards, also works with some Dell PERC RAID cards.'
arch=('i686' 'x86_64')
url='http://www.avagotech.com/'
license=('custom')
depends=('ncurses5-compat-libs')
source=("https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver//./-}_MegaCLI.zip"
	'LICENSE')
sha256sums=('d9b152ae3dab76a334b9251702dba3311ceed91b58aaf52d916eb4ba1c2ab6e9'
            '9be6a8818ea1dccec65d48b86dd0cc62009dc3886229e3dce41192a241bd55c3')

build() {
  cd "$srcdir"
  bsdtar -xf "Linux/MegaCli-$pkgver-1.noarch.rpm"
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  case "$CARCH" in
    'i686')   install -Dm755 "$srcdir/opt/MegaRAID/MegaCli/MegaCli"   "$pkgdir/usr/bin/megacli" ;;
    'x86_64') install -Dm755 "$srcdir/opt/MegaRAID/MegaCli/MegaCli64" "$pkgdir/usr/bin/megacli" ;;
  esac
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
