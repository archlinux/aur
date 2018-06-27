# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=macos-icon-theme
pkgver=4.5.1
pkgrel=1
pkgdesc='macOS iCons Collection'
arch=('any')
url='https://www.opendesktop.org/p/1102582/'
license=('GPL')
depends=('gtk-update-icon-cache')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1529627353/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('8c9b270b3de8f9bebbc13d7a5bd9428b')

prepare() {
    find -name '* *' -delete
    cp macOS/status/symbolic/*.svg macOS/devices/symbolic
    cp macOS/apps/128/accessories_calculator.png macOS/apps/128/gnome-calculator.png
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/icons/'{}' \;
}
