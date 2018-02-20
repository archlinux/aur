# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-gtk-theme
pkgver=1.3.6
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V Traditional GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518825512/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('dd4772649aea20c32c2a7ffb7f59358f')

_dirname='Gnome-OSX-V-Traditional-->2-themes'
_themename='Gnome-OSX-V-Traditional'

prepare() {
    mv "$_dirname/$_themename-${pkgver//./-}" "$_themename"
    mv "$_dirname/$_themename-NT-${pkgver//./-}" "$_themename-NT"
    rmdir "$_dirname"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
