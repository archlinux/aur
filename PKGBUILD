#ng/ Maintainer: Karol Babioch <karol@babioch.de>

pkgname=megacli
pkgver=8.07.14
pkgrel=2
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
  install -d "$pkgdir/opt/MegaRAID/MegaCli"
  cp "$srcdir/opt/MegaRAID/MegaCli/"* "$pkgdir/opt/MegaRAID/MegaCli"
  case "$CARCH" in
    'i686')
        rm "$pkgdir/opt/MegaRAID/MegaCli/MegaCli64"
        ;;
    'x86_64')
        mv "$pkgdir/opt/MegaRAID/MegaCli/MegaCli64" "$pkgdir/opt/MegaRAID/MegaCli/MegaCli"
        ;;
  esac
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

