# Maintainer: <andrew dot myers at wanadoo  dot fr>
pkgname=storecards
pkgver=0.1
pkgrel=1
pkgdesc="Keep all your store cards on your linux phone"
arch=('any')
url="https://github.com/fdservices/storecards"
license=('GPL')
depends=('tcl' 'tk' 'zint')
optdepends=('sane: for scanning Store Cards'
	    'imagemagick: for converting scanned images'
	    'pinephone-toolkit: to raise the backlight for barcode scanning'
	)
source=(http://github.com/fdservices/$pkgname/archive/$pkgver.tar.gz)
md5sums=('e5d7a545dbde1144602f06ca5329c4e4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
#   /usr/share/pixmaps/storecards
    install -d "$pkgdir"/usr/share/pixmaps/storecards
    install -m644 icons/* "$pkgdir"/usr/share/pixmaps/storecards
#   /usr/bin
    install -d "$pkgdir"/usr/bin
    install -m755 storecards "$pkgdir"/usr/bin/
#   /usr/share/applications
    install -d "$pkgdir"/usr/share/applications
    install -m644 storecards.desktop "$pkgdir"/usr/share/applications/
#   ~/.local/share/storecards
    path="${HOME}/.local/share"
    group=`id -gn ${USER}`
    install -d -o ${USER} -g ${group} "$pkgdir"$path/storecards
    install -m644 -o ${USER} -g ${group} data/* "$pkgdir"$path/storecards
}
