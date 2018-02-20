# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=gnome-osx-hsierra-gtk-theme
pkgver=1.3.6
pkgrel=1
epoch=5
pkgdesc='Gnome-OSX V HighSierra GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
license=('CCPL')
depends=('gtk-engine-murrine')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1518825458/s/$_s/t/$_t/$pkgname-$pkgver.tar.xz")
md5sums=('02f7e06e34ff3043476f862f92b85b30')

_dirname='Gnome-OSX-V-HSierra-->2-themes'
_themename='Gnome-OSX-V-HSierra'

prepare() {
    mv "$_dirname/$_themename-${pkgver//./-}" "$_themename"
    mv "$_dirname/$_themename-NT-${pkgver//./-}" "$_themename-NT"
    rmdir "$_dirname"
}

package() {
    find */ -type f -exec install -Dm644 '{}' $pkgdir/usr/share/themes/'{}' \;
}
