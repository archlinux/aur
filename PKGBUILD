# Maintainer: Abhishek "Abh15h3k" Banerji <abhishekbanerji1999@gmail.com>
# Contributor: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>
# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname="ryzenadj"
pkgver=0.17.0
pkgrel=1
pkgdesc="RyzenAdj tool for adjusting Ryzen Mobile power states"
url="https://github.com/FlyGoat/RyzenAdj"
arch=("x86_64")
depends=("pciutils")
makedepends=("git" "cmake")
optdepends=("ryzen_smu-dkms-git: (AUR) kernel module needed to access pm_table on systems with strict memory access policy")
license=("LGPL3")
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("848ac9d86ff65d30f5e2c8600aac2613f0f10003b0d6f0e516a54761d7345d44")

build() {
    cmake -B build -S "${srcdir}/RyzenAdj-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dsm 744 build/libryzenadj.so $pkgdir/usr/lib/libryzenadj.so
    install -Dm 744 ${srcdir}/RyzenAdj-${pkgver}/lib/ryzenadj.h $pkgdir/usr/include/ryzenadj.h
}
