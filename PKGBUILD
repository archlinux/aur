_pkgbasever=2.3.3
pkgname=libxft-bgra
pkgver=2.3.3.r7.7808631e
pkgrel=1
pkgdesc="libXft with BGRA glyph (color emoji) rendering & scaling patches by Maxime Coste"
arch=('x86_64')
license=('custom')
groups=('modified')
provides=('libxft')
conflicts=('libxft')
url="https://gitlab.freedesktop.org/xorg/lib/libxft.git"
depends=('fontconfig' 'libxrender' 'curl' 'xorg-util-macros')
makedepends=('git' 'pkgconf')
source=("git+$url" "https://gitlab.freedesktop.org/xorg/lib/libxft/merge_requests/1.patch")
md5sums=('SKIP' 'SKIP')


build() {
    cd libxft
    patch -p1 < ../1.patch
    sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd libxft
    make DESTDIR="${pkgdir}" install
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
