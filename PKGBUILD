# Maintainer: a172 <spartan074@gmail.com>

pkgbase=dxx-redux-git
pkgname=('d1x-redux-git' 'd2x-redux-git')
pkgver=1.0.r10.g8b03e18
pkgrel=1
pkgdesc='A source port of the Descent and Descent 2engines (git version)'
arch=('x86_64')
url='https://www.dxx-redux.com/'
license=('custom:D1X-Rebirth' 'custom:Parallax')
depends=('physfs' 'sdl12-compat' 'sdl_mixer' 'libpng' 'glew')
makedepends=('git' 'cmake')
source=('git+https://github.com/dxx-redux/dxx-redux.git')
sha256sums=('SKIP')

pkgver() {
    git -C dxx-redux describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local -a _build_opts=(
        '-DCMAKE_BUILD_TYPE=RelWithDebInfo'
        '-DCMAKE_INSTALL_PREFIX=/usr'
    )
    cd "${srcdir}/dxx-redux/d1"
    cmake -B build "${_build_opts[@]}"
    cmake --build build
    cd "${srcdir}/dxx-redux/d2"
    cmake -B build "${_build_opts[@]}"
    cmake --build build
}

package_d1x-redux-git() {
    pkgdesc='A source port of the Descent engine (git version)'
    provides=('d1x-redux')
    conflicts=('d1x-redux')

    install -D -m755 dxx-redux/d1/build/main/d1x-redux -t "${pkgdir}/usr/bin"
    install -D -m644 dxx-redux/d1/d1x-redux.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 dxx-redux/d1/d1x-redux.xpm -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 dxx-redux/COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_d2x-redux-git() {
    pkgdesc='A source port of the Descent 2 engine (git version)'
    provides=('d2x-redux')
    conflicts=('d2x-redux')

    install -D -m755 dxx-redux/d2/build/main/d2x-redux -t "${pkgdir}/usr/bin"
    install -D -m644 dxx-redux/d2/d2x-redux.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 dxx-redux/d2/d2x-redux.xpm -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 dxx-redux/COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
