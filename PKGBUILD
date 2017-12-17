# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos-icon-theme
pkgver=4.1.5
pkgrel=6
pkgdesc='macOS Icons Theme'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
license=('GPL')
depends=('gtk-update-icon-cache')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1510321229/s/$_s/t/$_t/macOS.tar.xz")
md5sums=('056982040d0efdcf4fa93b0e5bc9bc3d')

prepare() {
    find -name '* *' -delete
    cp macOS/status/symbolic/*.svg macOS/devices/symbolic
    mv macOS/apps/128/accessories_calculator.png macOS/apps/128/accessories-calculator.png
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/icons/'{}' \;
}
