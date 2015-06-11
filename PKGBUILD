# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
_pkgver=0.5
_pkgname=xsecurelock
pkgname=xsecurelock-git
pkgver=0.5.32.b6f1476
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
            'xorg-server-utils: for the saver_blank module'\
            'xscreensaver: for the saver_xscreensaver module')
provides=('xsecurelock')
conflicts=('xsecurelock')
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname-$_pkgver"::'git+https://github.com/google/xsecurelock.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname-$_pkgver"
	echo "$_pkgver.$(git rev-list --count HEAD).$(git rev-parse --short master)"
}

build() {
	cd "$srcdir/$_pkgname-$_pkgver"
	sh autogen.sh
	./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --with-pam-service-name=system-auth
	make
}

package() {
	cd "$srcdir/$_pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install
}


