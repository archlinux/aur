# Maintainer: Filon Oikonomou <filwn.oikonomou at gmail dot com>

pkgname=sekirofpsunlock
pkgver=0.2.3
pkgrel=1
pkgdesc="Patcher to set custom fps limit and resolution for Sekiro: Shadows Die Twice"
# I haven't tested whether this builds on other architectures, but we're
# restricted to x86_64 by Sekiro anyway.
arch=('x86_64')
url="https://github.com/Lahvuun/sekirofpsunlock"
license=('MIT')
makedepends=(
    meson
    ninja
    gcc
)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Lahvuun/sekirofpsunlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d6a9e631ae0da32d010b63d0e69e64c3c47616dfba77ba2dae4486ee260004d')

build() {
    cd "sekirofpsunlock-${pkgver}"
    meson setup build -Db_ndebug=if-release -Dbuildtype=release
    ninja -C build
}

package() {
    cd "sekirofpsunlock-${pkgver}"
    install -Dm755 \
        build/sekirofpsunlock \
        -t "$pkgdir/usr/bin/"
    install -Dm644 \
        LICENSE \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 \
        README.md \
        -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 \
        contrib/dxvk.conf \
        -t "${pkgdir}/usr/share/${pkgname}/"
}
