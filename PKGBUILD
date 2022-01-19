# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wluma
pkgver=4.0.0
pkgrel=1
license=('ISC')
pkgdesc='Automatic brightness adjustment based on screen contents and ALS'
url='https://github.com/maximbaz/wluma'
arch=('x86_64')
depends=('vulkan-icd-loader' 'vulkan-driver' 'wayland' 'systemd-libs' 'glibc' 'gcc-libs' 'v4l-utils')
makedepends=('cargo' 'clang' 'systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('5f7098d9dfffb43dcc14cf4295491776cd446b0ede9034538ed0c8db2dc38ef4'
            'SKIP')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

build() {
    cd "${pkgname}-${pkgver}"
    make build
}

check() {
    cd "${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
