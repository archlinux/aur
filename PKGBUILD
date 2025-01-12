# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Matt Parnell /ilikenwf <parwok@gmail.com>
# Contributor: Jonathan <eyeswide@gmail.com>

pkgname=libpciaccess-git
pkgver=0.18.1.r1.gf73f4ca
pkgrel=1
pkgdesc='X11 PCI access library (git version)'
arch=('x86_64')
url='https://gitlab.freedesktop.org/xorg/lib/libpciaccess/'
license=('LicenseRef-libpciaccess')
depends=('glibc' 'zlib')
makedepends=('git' 'meson' 'ninja' 'xorg-util-macros')
provides=('libpciaccess')
conflicts=('libpciaccess')
source=('git+https://gitlab.freedesktop.org/xorg/lib/libpciaccess.git')
sha256sums=('SKIP')

pkgver() {
    git -C libpciaccess describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libpciaccess\.//;s/^v//'
}

build() {
    arch-meson libpciaccess build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 libpciaccess/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
