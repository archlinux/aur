# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>

pkgname=light
pkgver=1.2.2
pkgrel=3
pkgdesc='Program to easily change brightness on backlight-controllers.'
arch=('x86_64')
url='https://github.com/haikarainen/light'
license=('GPL3')
depends=('glibc')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/haikarainen/light/archive/v${pkgver}.tar.gz"
        "114.patch"
        "122.patch")
sha256sums=('62e889ee9be80fe808a972ef4981acc39e83a20f9a84a66a82cd1f623c868d9c'
            'e0bee2249f59f66cb02ef98dc18e36172d141eb8b9f1bb1c2c8de8323c9ad73e'
            '7dd149ef9ce9647f70a8047c0690e4ff121670ba58cf5aaac2fd8cd29e03d03f')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/114.patch"
    patch -Np1 -i "${srcdir}/122.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr --with-udev
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=4 sw=4 et:
