# Maintainer: Carlos Mogas da Silça <r3pek@r3pek.org>
# Contributer: Andrey Vihrov

pkgname=xfce4-screensaver
pkgver=0.1.4
pkgrel=2
pkgdesc='Screensaver for XFCE Desktop'
url="https://www.xfce.org"
arch=('x86_64')
license=('GPL')
depends=('libxss' 'libxklavier>=5.2' 'garcon>=0.5.0')
makedepends=('intltool' 'systemd' 'xfce4-dev-tools' 'xmlto' 'docbook-xsl' 'exo')
groups=('xfce4')
source=("https://git.xfce.org/apps/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8a14cbc92b718f591c25bc507b68ae03d5bf66850d4bdd73f4a0e39dd8633902')

build() {
	cd "${pkgname}-${pkgver}"
    	./autogen.sh \
        	--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir="/usr/lib/${pkgname}" \
		--enable-docbook-docs \
		--disable-dependency-tracking
	sed -i -e '/\$CC/s/-shared/\0 -Wl,--as-needed/' libtool
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install
}
