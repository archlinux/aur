# Maintainer

_name=libbpf
pkgname=lib32-$_name
pkgver=1.5.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=('x86_64')
license=('LGPL2.1')
depends=($_name 'lib32-glibc' 'lib32-libelf')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('0cc25addcf5fcee0537d598037feab4bc73a513e6025d8f559bed58fe8850a10fcfeefd1a9dafc5e0bac6202d445944b12811cb7254b9b3be4dd3d2cc1e9419b')
b2sums=('fd9bbf7689632c6f3fc18705bf1cfb5ba8abca632f6da1264692f0b6ff0e5887fb88697dd4418cc9a451df3421015f4c8de5162c1b8a40594af050dca3442669')

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
