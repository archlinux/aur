# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det

pkgname=eglexternalplatform-git
pkgver=1.2.r2.gcf9f105
pkgrel=1
pkgdesc='EGL External Platform interface (git version)'
arch=('any')
url='https://github.com/NVIDIA/eglexternalplatform/'
license=('MIT')
depends=('libegl')
makedepends=('git' 'meson')
provides=('eglexternalplatform')
conflicts=('eglexternalplatform')
source=('git+https://github.com/NVIDIA/eglexternalplatform.git')
sha256sums=('SKIP')

pkgver() {
    git -C eglexternalplatform describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson eglexternalplatform build --includedir /usr/include/EGL
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 eglexternalplatform/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
