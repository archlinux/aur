# Maintainer

_name=libbpf
pkgname=lib32-$_name
pkgver=1.4.2
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=('x86_64')
license=('LGPL2.1')
depends=($_name 'lib32-glibc' 'lib32-libelf')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('b0faf45e77fc0197239b87d74010bad6b7ef7d48c1b3de2a3960164d9029851e2ad204b92d0cccb2fde2d0dfe44d9fa7f24b35a4917179dbab1bee192d3780db')
b2sums=('7529e6521337d45210ee2e3d00aae7c8cac309a4b3f36ffdd9c4a6c4439f266ee654b6ad6abaea2e43310260182bd9ad52ff162339545027050329d8307fe0d5')

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
