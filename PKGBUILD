# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=wgsim
pkgname="${_name}"-git
pkgver=r14.a12da33
pkgrel=1
pkgdesc="Whole genome read simulator from a reference genome"
arch=('x86_64')
url=https://github.com/lh3/"${_name}"
license=('custom:Heng Li')
source=('wgsim::git+https://github.com/lh3/wgsim.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${_name}"
  gcc -g -O2 -Wall -o wgsim wgsim.c -lz -lm
}

package() {
  cd "${srcdir}"/"${_name}"
  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"
  install -Dm755 "${_name}"_eval.pl "${pkgdir}"/usr/bin/"${_name}"_eval.pl
}
