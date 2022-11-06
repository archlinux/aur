# Maintainer: Emil <emildekeyser@telenet.be>

pkgname=dino-patched-git
pkgver=v0.2.0.r317.g3296a7ad
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala patched with extra stuff"
arch=('i686' 'x86_64' 'aarch64')
url="https://dino.im/"
license=('GPL3')
depends=('glib2>=2.38' 'glib-networking' 'gtk4' 'gpgme'
	 'libgee>=0.10' 'libgcrypt' 'libsoup' 'sqlite' 'qrencode'
	 'libsignal-protocol-c' 'gspell' 'gst-plugins-base'
	 'gst-plugins-good' 'gst-plugin-gtk' 'webrtc-audio-processing'
	 'libnice' 'libsrtp' 'libcanberra')
makedepends=('git' 'cmake' 'vala>=0.34' 'ninja')
provides=("dino")
conflicts=("dino")
source=('dino::git+https://github.com/emildekeyser/dino-fork#branch=mergerino')
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/dino"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/dino"
    ./configure --prefix="/usr" CC="$CC" CFLAGS="$CFLAGS" VALACFLAGS="$VALACFLAGS"
    make
}

package() {
    cd "${srcdir}/dino"
    make DESTDIR="${pkgdir}/" install
}

# check() {
#     cd "${srcdir}/dino"
#     echo "Executing xmpp-vala-test:"
#     build/xmpp-vala-test
# }
