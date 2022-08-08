# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wldash
pkgver=0.3.0
pkgrel=2
pkgdesc='Wayland launcher and dashboard'
arch=('x86_64')
url='https://git.sr.ht/~kennylevinsen/wldash'
license=('GPL3')
depends=('alsa-lib' 'dbus' 'fontconfig' 'gcc-libs' 'glibc' 'libpulse')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~kennylevinsen/${pkgname}/archive/v${pkgver}.tar.gz"
        "fix-cargo-lock.patch"
        "update-fontconfig.patch")
sha512sums=('48f5356e76f77f9284b5533ee410b9a6ea2cb279da29f45d827ee521c4a46213909298e4c08c05cf1964b280d0cfb5124b0b85e85437c8289d7557194b95548d'
            '887a94e2af4aac20c118f75a63b5b12f41b925efa3a685792953dda4b02d94d08c1048cc9db61794d296470c2b85fca1fc947ba0b6f5b60dfc0ffcbba11c242a'
            'b9a03d3f9f752225e27f2273f136712de89695575a8e40e16434b03eebfba0d185b552d163006acedad70983d2d5bfdfef996b7855bf66f2b2ceb9f371ba8d43')

prepare() {
    cd "${pkgname}-v${pkgver}"
    patch -Np1 -i "${srcdir}/fix-cargo-lock.patch"
    patch -Np1 -i "${srcdir}/update-fontconfig.patch"
}

build() {
    cd "${pkgname}-v${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
