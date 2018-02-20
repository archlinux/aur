# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-light-gtk-theme
pkgver=1.3.6
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V Traditional Light GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518825529/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('bd1caec7b416e18b929a9448083249a0')

_dirname='Gnome-OSX-V-traditional-light-menus-->2-themes'
_themename='Gnome-OSX-V-Traditional'

prepare() {
    mv "$_dirname/$_themename-${pkgver//./-}-light-menu" "$_themename-Light"
    mv "$_dirname/$_themename-NT-${pkgver//./-}-light-menu" "$_themename-Light-NT"
    rmdir "$_dirname"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
