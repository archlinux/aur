# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
pkgname=kime-git
pkgver=3.1.1.r32.g2f38207
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
arch=('x86_64')
license=('GPL-3.0-or-later')
conflicts=('kime')
provides=('kime')
depends=('dbus' 'libxcb' 'libxkbcommon' 'libglvnd' 'noto-fonts-cjk')
makedepends=('git' 'cargo' 'clang' 'llvm' 'meson' 'ninja' 'python'
             'gtk3' 'gtk4' 'qt5-base' 'qt6-base' 'wayland')
optdepends=('gtk3: GTK3 IM module support'
            'gtk4: GTK4 IM module support'
            'qt5-base: Qt5 IM module support'
            'qt6-base: Qt6 IM module support'
            'wayland: Wayland support')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -b2-
}

build() {
    cd "${pkgname}"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "${pkgname}"
    meson install -C build --destdir "${pkgdir}"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
