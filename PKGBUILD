# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-thedot
pkgver=0.6
pkgrel=2
pkgdesc="A mouse theme with circles (fork of the unmaintained original)"
arch=('any')
url="https://www.gnome-look.org/p/1244392/"
license=('GPL')
depends=()

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/download/id/1547762758/s/$_s/t/$_t/u//thedot0.6.tar.gz"
	"thedot.patch")
md5sums=('274dd7436d10b6f597eee19f280588ac'
         '617e5bca40fd593ad94ee4223abe0708')

prepare() {
cd "${srcdir}/thedot0.6/"
patch -Np1 -i "${srcdir}/thedot.patch"
}

package() {
cd "${srcdir}/thedot0.6/"

# Install
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR Dot-{Dark,Light,Transparent} ${pkgdir}/usr/share/icons/
}
