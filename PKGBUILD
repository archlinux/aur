# Maintainer

_name=libbpf
pkgname=lib32-$_name
pkgver=1.3.0
pkgrel=2
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=('x86_64')
license=('LGPL2.1')
depends=($_name 'lib32-glibc' 'lib32-libelf')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('59990189538e47765542e9ed6e88bc78c9d29bc077b5666bb1303cf15579c90b3d35a0d631b9bbd4bff2708243dc91d901bd68c119fb74dfd10a3e1066aa9acc')
b2sums=('5ee0a45cd06be482c9523ec2a9bb26cf12b89df23f515b037badda868770069d5ffb751c011222b86b1d43034a1cdd537cb263883ed0645641548adc9c9896eb')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_name}-${pkgver}
  make -C src
}

package() {
  cd ${_name}-${pkgver}
  make -C src DESTDIR="${pkgdir}" LIBSUBDIR=lib32 install
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "$pkgdir"/usr/include
}

# vim: ts=2 sw=2 et:
