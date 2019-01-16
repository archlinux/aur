# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

_pkgname=orage
pkgname=${_pkgname}-git
pkgver=orage.4.12.1.r319.g11aa2e5f
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=("i686" "x86_64")
license=('GPL2')
url="http://www.xfce.org"
groups=('xfce4-git')
depends=('hicolor-icon-theme' 'xfce4-panel-git' 'libnotify')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools-git')
provides=("orage")
conflicts=("orage")
source=("${_pkgname}::git://git.xfce.org/apps/$_pkgname")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

  cd "${_pkgname}"
  # https://bugzilla.redhat.com/show_bug.cgi?id=1512302
  patch -Np1 -i ../../libical3.patch

}

build() {
    
    cd "${srcdir}/${_pkgname}"
    
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib  \
    --localstatedir=/var --disable-static --enable-debug=minimum \
   --enable-maintainer-mode
  make
}

package() {
	cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
