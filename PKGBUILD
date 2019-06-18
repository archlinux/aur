pkgname=goglus-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="X11 Mouse Theme"
arch=('any')
url="https://www.opendesktop.org/p/999675/"
license=('GPL')
depends=('xorg-xcursorgen')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p" | head -n2))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1460734670/s/$_s/t/$_t/127487-goglus_cursor.tar.gz")
md5sums=('d21d3f4c23e0a8dc5169a4457cda4b75')

package() {
    cd $srcdir/goglus_cursor/source
    sh make.sh
    install -d $pkgdir/usr/share/icons/Goglus
    cp -rf $srcdir/goglus_cursor/source/cursors $pkgdir/usr/share/icons/Goglus/cursors
    cp -rf $srcdir/goglus_cursor/index.theme $pkgdir/usr/share/icons/Goglus/index.theme
}
