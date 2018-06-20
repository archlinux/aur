# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=x11vnc-ex-git
pkgver=0.9.14.r498.g64f4976
pkgrel=1
pkgdesc='VNC server for real X displays'
url="https://libvnc.github.io"
arch=('i686' 'x86_64')
license=('GPL')
provides=('x11vnc')
conflicts=('x11vnc')
depends=('cairo' 'libxcursor' 'libxcomposite' 'libvncserver' 'libxtst' 'libxinerama' 'libxdamage' 'libxrandr' 'avahi' 'libjpeg-turbo')
makedepends=(autoconf-archive)
optdepends=('tk: GUI support'
	    'net-tools: -auth guess'
	    'xf86-video-dummy: Xdummy script'
	    'java-environment: java-applet support')
source=("x11vnc::git+https://github.com/LibVNC/x11vnc.git")
sha1sums=('SKIP')

pkgver() {
	cd x11vnc
	printf "0.9.14.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd x11vnc
	autoreconf -fiv
}

build() {
	cd x11vnc
	./configure --prefix=/usr
	make AM_LDFLAGS='-lturbojpeg'
}

package() {
	cd x11vnc
	make DESTDIR="${pkgdir}" install
	install -m755 tkx11vnc misc/{rx11vnc,Xdummy} "${pkgdir}/usr/bin"
}
