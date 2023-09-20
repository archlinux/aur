# Maintainer: Nikolaos Bezirgiannis

pkgname=blst
pkgver=0.3.11
pkgrel=1
pkgdesc='Multilingual BLS12-381 signature library'
arch=('aarch64' 'x86_64')
url='https://github.com/supranational/blst'
license=('Apache')
depends=('glibc')
source=("https://github.com/supranational/blst/archive/refs/tags/v${pkgver}.tar.gz")
options=('staticlibs')
sha256sums=('d0a6e2a69490cc45f0a531a684a225e56fe22303665157cfa397ba5605447eb9')

build() {
cd "${pkgname}-${pkgver}"
./build.sh -shared
}

package() {
cd "${pkgname}-${pkgver}"
install -Dm755 -t "${pkgdir}/usr/lib" libblst.so
install -Dm644 -t "${pkgdir}/usr/lib" libblst.a
install -Dm644 -t "${pkgdir}/usr/include" bindings/*.h
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

mkdir -p ${pkgdir}/usr/lib/pkgconfig
cat <<EOF > ${pkgdir}/usr/lib/pkgconfig/libblst.pc
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: libblst
Description: ${pkgdesc}
URL: ${url}
Version: ${pkgver}

Cflags: -I\${includedir}
Libs: -L\${libdir} -lblst
Libs.private:
EOF
}
