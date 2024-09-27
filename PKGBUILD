# Maintainer: Abhishek "Abh15h3k" Banerji <abhishekbanerji1999@gmail.com>
# Contributor: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>
# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname="ryzenadj"
pkgver=0.16.0
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
sha256sums=("7bef7dbde006afbe316091d8da8c8c551d5d7d43185d9e62281671959b7a3ca2")

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
