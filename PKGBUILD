# Maintainer: riey <creeper844@gmail.com>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=kime
pkgver=3.1.1
pkgrel=2
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
depends=('noto-fonts-cjk')
optdepends=('gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support')
makedepends=('cargo' 'clang' 'llvm' 'cmake' 'cairo' 'libxcb' 'dbus')
arch=('any')
license=('GPL3')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")

sha256sums=('d401170d822b5d5ebae683a2651273f2b73cdd2f75c8ff3b6c747a846f02961b')

build() {
    cd "${pkgname}-${pkgver}"

    # Clean cache
    rm -rf build || true
    export RUSTFLAGS="-L ${srcdir}/${pkgname}-${pkgver}/target/release ${RUSTFLAGS}"
    # https://github.com/Riey/kime/issues/701#issuecomment-2944494908
    scripts/build.sh -ar
}

package() {
    cd "${pkgname}-${pkgver}"

    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
