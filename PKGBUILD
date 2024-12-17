# Maintainer: Ciptik <stepan.ciptik@yandex.ru>
# Contributor: cktan <github.com/cktan>

pkgname=tomlc99-git
pkgver=1.0
pkgrel=1
pkgdesc="TOML C library"
arch=('x86_64')
url="https://github.com/cktan/tomlc99"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
provides=('tomlc99')
conflicts=('tomlc99')
options=('!debug')
source=("git+https://github.com/cktan/tomlc99.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/tomlc99"
  make
}

package() {
    cd "${srcdir}/tomlc99"
    install -Dm644 toml.h "${pkgdir}/usr/include/toml.h"
    install -Dm755 libtoml.so.1.0 "${pkgdir}/usr/lib/libtoml.so.1.0"
    ln -s libtoml.so.1.0 "${pkgdir}/usr/lib/libtoml.so"
    install -Dm755 libtoml.a "${pkgdir}/usr/lib/libtoml.a"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    mkdir -p "${pkgdir}/usr/lib/pkgconfig"
    cat << EOF > "${pkgdir}/usr/lib/pkgconfig/libtoml.pc"
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: libtoml
Description: TOML C library
Version: ${pkgver}
Libs: -L\${libdir} -ltoml
Cflags: -I\${includedir}
EOF
}
