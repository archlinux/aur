# Maintainer: Carlos Mogas da Silça <r3pek@r3pek.org>

pkgname=xfce4-screensaver
pkgver=0.1.0
pkgrel=1
pkgdesc='Screensaver for XFCE Desktop'
url="https://www.xfce.org"
arch=('x86_64')
license=('GPL')
depends=('glib2>=2.50.0' 'gtk3>=3.22.0' 'libxklavier>=5.2' 'libx11>=1.0' 'xorg-xrandr>=1.3' 'xfconf>=4.12.1' 'libxfce4ui>=4.12.1' 'libxfce4util>=4.12.1' 'garcon>=0.5.0')
makedepends=('intltool' 'systemd' 'xfce4-dev-tools')
groups=('xfce4')
conflicts=('mate-screensaver-gtk3' 'mate-screensaver' 'gnome-screensaver')
replaces=('mate-screensaver-gtk3' 'mate-screensaver' 'gnome-screensaver')
source=("https://git.xfce.org/apps/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz" 
	"xfce4-screensaver.pam")
sha256sums=('f218cd3e686d99c5e34cb0c639d592ec40d399dafb4ad3dc6d4b63717b775e9a'
	    'f8f58c56a2543a005b13271624bbeec43bd6fe4403a7a4b5e9d10e643cd46f37')

build() {
	cd "${pkgname}-${pkgver}"
    	./autogen.sh \
        	--prefix=/usr \
        	--sysconfdir=/etc
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install

	cp -f "${srcdir}/xfce4-screensaver.pam" "${pkgdir}/etc/pam.d/xfce4-screensaver"
}
