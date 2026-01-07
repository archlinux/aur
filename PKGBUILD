# Maintainer: Super Tecno Gym <banana@grrlz.net>
# Contributor: Sam Day <me@samcday.com>

pkgname="qrtr"
pkgdesc="Userspace reference for net/qrtr in the Linux kernel"
pkgver=1.2
pkgrel=1
arch=(aarch64 x86_64)
url="https://github.com/andersson/qrtr"
license=("BSD-3-Clause")
_srcname="${pkgname}-${pkgver}"
source=("${_srcname}.tar.gz::https://github.com/linux-msm/qrtr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a82bf80246fe71287b13c66c0466208822e8337fcd4aaf302eee6c5fcb48a52')
makedepends=(meson)

build() {
        cd "$_srcname"

        mkdir -p build
        meson setup build --prefix=/usr
        meson compile -C build

}

package() {
        cd "$_srcname"

        meson install -C build --destdir "$pkgdir"
        install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
