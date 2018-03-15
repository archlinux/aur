# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-thedot
pkgver=0.3
pkgrel=3
pkgdesc="A mouse theme with circles"
arch=('any')
url="https://www.gnome-look.org/p/999763/"
license=('GPL')
depends=()

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1464310837/s/$_s/t/$_t/u//174031-DOT_0.3.tar.gz"
	"thedot.patch")
md5sums=('283b367cbc93c3cad05fa044b8499248'
         'b482b06b978dd30b4fd2a8943cb3508a')

prepare() {
cd ${srcdir}/DOT_${pkgver}
patch -Np1 -i ../thedot.patch
}

package() {
cd ${srcdir}/DOT_${pkgver}
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR {dark,light} ${pkgdir}/usr/share/icons/
}


