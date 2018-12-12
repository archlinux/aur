# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
_pkgname=xsecurelock
pkgname=xsecurelock-git
pkgver=1.2.r7.gc75d8e2
pkgrel=1
pkgdesc="X11 screen lock utility with security in mind"
arch=('any')
url="https://github.com/google/xsecurelock"
license=('APACHEV2')
groups=()
depends=('libx11' 'pam')
makedepends=('git')
checkdepends=()
optdepends=('mplayer: for the saver_mplayer module'\
            'mpv: for the saver_mpv module'\
            'imagemagick: for the auth_pamtester module'\
            'pamtester: for the auth_pamtester module'\
            'xorg-apps: for the saver_blank module'\
            'xscreensaver: for the saver_xscreensaver module')
provides=('xsecurelock')
conflicts=('xsecurelock')
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname"::'git+https://github.com/google/xsecurelock.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	sh autogen.sh
	./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --with-pam-service-name=system-auth
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}


