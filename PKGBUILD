pkgname=s5x-thumbnailer
pkgver=1.0
pkgrel=2
pkgdesc="A thumbnailer for Settler HoK Maps"
arch=(any)
url="https://codeberg.org/JakobDev/s5x-thumbnailer"
license=("BSD-2-Clause")
depends=("python" "imagemagick" "bbatools5")
makedepends=("meson")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/s5x-thumbnailer/archive/${pkgver}.tar.gz")
sha256sums=("1306bd48dc0c2f4ec570ed5c56fd682ece8d70d8ce8e40ef3aadfaa30df974c7")

build() {
    cd s5x-thumbnailer
    arch-meson -Dbbatool-path=/usr/lib/bbatools5/bbaToolS5 build
    meson compile -C build
}

package() {
    cd s5x-thumbnailer
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
