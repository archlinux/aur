# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Scimmia

pkgname=('wayland-nodocs-git')
pkgver=1.18.0.r18.gef611a80
pkgrel=1
pkgdesc='A computer display server protocol (git version)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2')
makedepends=('git' 'meson' 'ninja' 'libxslt')
source=('git+https://gitlab.freedesktop.org/wayland/wayland.git')
sha256sums=('SKIP')

pkgver() {
    git -C wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    meson build wayland --buildtype='release' --prefix='/usr' --disable-documentation
}

#check() {
#    ninja -C build test
#}

package_wayland-nodocs-git() {
    provides=('wayland'  "wayland=${pkgver}")
    conflicts=('wayland')
    
    DESTDIR="$pkgdir" ninja -C build install
#    mkdir -p docs/share
#    mv "${pkgdir}/usr/share/"{doc,man} docs/share
    install -D -m644 wayland/COPYING "$p{kgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
