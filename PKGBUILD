# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wluma
pkgver=1.2.2
pkgrel=1
license=('MIT')
pkgdesc='Automatic brightness adjustment based on screen contents'
url='https://github.com/maximbaz/wluma'
arch=('x86_64')
depends=('vulkan-icd-loader' 'vulkan-driver' 'wayland')
makedepends=('meson' 'ninja' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('dabd6cdf0b9c644af52ad6fad40861829f43c534d42123af2f1f4465b31d5bed'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

build() {
    cd "${pkgname}-${pkgver}"
    meson build --prefix=/usr --buildtype=plain
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
