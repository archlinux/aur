# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
pkgname=kime
pkgver=3.2.0
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('dbus' 'libxcb' 'libxkbcommon' 'libglvnd' 'noto-fonts-cjk')
makedepends=('cargo' 'clang' 'llvm' 'meson' 'ninja' 'python'
             'gtk3' 'gtk4' 'qt5-base' 'qt6-base' 'wayland')
optdepends=('gtk3: GTK3 IM module support'
            'gtk4: GTK4 IM module support'
            'qt5-base: Qt5 IM module support'
            'qt6-base: Qt6 IM module support'
            'wayland: Wayland support')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ba5be5ed741f369f802d2c015ad2a2573209056ea837eb75fb302ce2f05c0365a1274448ab7a32fa9e920624107b385444496bcb3772801dae9270a48f5f938f')

build() {
    cd "${pkgname}-${pkgver}"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    meson install -C build --destdir "${pkgdir}"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
