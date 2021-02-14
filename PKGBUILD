# Maintainer: riey <creeper844@gmail.com>
pkgname=kime
pkgver=1.0.0
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
optdepends=('libappindicator-gtk3: indicator support'
            'gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'libxcb: xim support'
            'cairo: xim support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'ninja' 'cairo' 'libxcb')
arch=('any')
source=(
    ${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
    install-patch.diff
)
md5sums=('6ccfdb576547886736c5e0e93d9a6f09'
         'fff00ce5661096c7fe0b2a97ef91e89c')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/install-patch.diff"
}

build() {
    cd "${pkgname}-${pkgver}"
    # Clean cache
    rm -rf build || true
    scripts/build.sh -ar
}

package() {
    cd "${pkgname}-${pkgver}"

    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

