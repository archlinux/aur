# Maintainer: Abhishek "Abh15h3k" Banerji <abhishekbanerji1999@gmail.com>
# Contributor: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>
# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname="ryzenadj"
pkgver=0.14.0
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
sha256sums=("adb9f040b10fe0a7c1a4317b4c9b404f6db66631754300fc364003779312a0b1")

build() {
    cd "${srcdir}/RyzenAdj-${pkgver}"
    mkdir build -p && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "${srcdir}/RyzenAdj-${pkgver}"
    install -Dsm 755 build/ryzenadj $pkgdir/usr/bin/ryzenadj
    install -Dsm 744 build/libryzenadj.so $pkgdir/usr/lib/libryzenadj.so
    install -Dm 744 lib/ryzenadj.h $pkgdir/usr/include/ryzenadj.h
}
