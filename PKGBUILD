# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos-icon-theme
pkgver=4.2
pkgrel=1
pkgdesc='macOS iCons Collection'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
license=('GPL')
depends=('gtk-update-icon-cache')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1524703499/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('24c1eb908a1f0c0a0e3558f0405e252e')

prepare() {
    find -name '* *' -delete
    cp macOS/status/symbolic/*.svg macOS/devices/symbolic
    mv macOS/apps/128/accessories_calculator.png macOS/apps/128/accessories-calculator.png
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/icons/'{}' \;
}
