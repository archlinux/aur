# Maintainer: Huayu Zhang<zhanghuayu.dev@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=bin86-aarch64
_pkgname=bin86
pkgver=0.16.21
pkgrel=4
pkgdesc='A complete 8086 assembler and loader for host aarch64'
arch=('aarch64')
license=('GPL')
url='https://v3.sk/~lkundrak/dev86/'
depends=('glibc')
source=("https://sources.archlinux.org/other/community/dev86/${_pkgname}-${pkgver}.tar.gz"
        'bin86-0.16.17-aarch64-1.patch')
sha256sums=('021e37cde3a20632c4c9000993cb4aa9f58cb82b1d3c26b9aeb62d6566925738'
            '21fd4fc7cd5823010dbaad31029cf763b5ae94c0d44cf0eea21560e091ac207b')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 < ../bin86-0.16.17-aarch64-1.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  make PREFIX=/usr
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  make PREFIX="${pkgdir}"/usr MANDIR="${pkgdir}"/usr/share/man/man1 install
}
