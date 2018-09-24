# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mcos-shell-theme
pkgver=1.2
pkgrel=2
pkgdesc='McOS Shell Theme'
arch=('any')
url='https://www.opendesktop.org/p/1241688/'
license=('GPL')
depends=('gnome-shell-extensions')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1529367872/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('3e8e2e6d642665b4ad79563dcf7bd6d6')

prepare() {
    mv McOS-Shell-themes/McOS-Dark-Shell .
    mv McOS-Shell-themes/McOS-Light-Shell .
    rm -rf McOS-Shell-themes
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
