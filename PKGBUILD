# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname="tqftpserv"
pkgdesc="Trivial File Transfer Protocol server over AF_QIPCRTR"
pkgver=1.2
pkgrel=1
arch=(aarch64 x86_64)
url="https://github.com/linux-msm/tqftpserv"
license=("BSD-3-Clause")
conflicts=("${pkgname%-git}")
groups=(qcom-icnss-wlan)
_srcname="${pkgname}-${pkgver}"
source=("${_srcname}.tar.gz::https://github.com/linux-msm/tqftpserv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a3850c34e48f23b7bc360d70f1e91700de2f8c60af003eda93e14182f8cf6af1')
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
