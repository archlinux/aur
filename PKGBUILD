# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
pkgname=kime-git
pkgver=3.0.2.r1.g10f35aa
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
optdepends=('gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'wayland: wayland support')
# FIXME
depends=('dbus' 'fontconfig' 'freetype2' 'libxcb' 'noto-fonts-cjk')
makedepends=('git' 'cargo' 'clang' 'llvm' 'cmake' 'wayland')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -b2-
}

# FIXME
build() {
    cd "${pkgname}"
    # Clean build cache
    rm -rf build || true
    scripts/build.sh -ar
}

package() {
    cd "${pkgname}"
    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
