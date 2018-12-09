# Maintainer: Johannes Wienke <languitar@semipol.de>
pkgname=xsecurelock
pkgver=1.2
pkgrel=1
pkgdesc="X11 screen lock utility with security in mind"
arch=('any')
url="https://github.com/google/xsecurelock"
license=('APACHE')
groups=()
depends=('libx11' 'pam' 'libxcomposite' 'libxmu')
checkdepends=()
optdepends=('mplayer: for the saver_mplayer module'\
            'mpv: for the saver_mpv module'\
            'imagemagick: for the auth_pamtester module'\
            'pamtester: for the auth_pamtester module'\
            'xorg-xset: for the saver_blank module'\
            'xscreensaver: for the saver_xscreensaver module')
source=("https://github.com/google/xsecurelock/archive/v${pkgver}.tar.gz")
md5sums=('adfdbfca57a0b3a9f1e54b4f81970560')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sh autogen.sh
	./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --with-pam-service-name=system-auth
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}


