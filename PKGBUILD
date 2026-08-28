# Maintainer: 悠远的天穹 <vastsky2006@outlook.com>
#
# VSZip: Ark/Kerfuffle fallback plugin driven by the 7-Zip CLI.
# 源码来自 Gitee 仓库（git+https，匿名可克隆）。

pkgname=vszip
pkgver=0.1.0
pkgrel=1
pkgdesc="Low-priority Ark/Kerfuffle fallback plugin: handles files no other plugin claims via the 7-Zip CLI (thin archives via GNU ar, single-stream auto-expansion)"
arch=('x86_64')
url="https://gitee.com/vastSky2006/vszip"
license=('LGPL-3.0-or-later')
depends=('7zip' 'ark')
makedepends=('cmake' 'ninja' 'qt6-base' 'kfilemetadata')
source=("vszip::git+https://gitee.com/vastSky2006/vszip.git")
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/vszip" -B "${srcdir}/build" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    cmake --build "${srcdir}/build"
}

check() {
    ctest --test-dir "${srcdir}/build" --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
