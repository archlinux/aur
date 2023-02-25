# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=ocaml-libvirt-git
_pkgname=libvirt-ocaml
pkgver=r177.53bf916
pkgrel=1
pkgdesc="OCaml bindings for libvirt"
arch=('i686' 'x86_64')
url="https://libvirt.org/"
license=('GPL2')
depends=('ocaml' 'libvirt')
makedepends=('ocaml-findlib')
provides=('ocaml-libvirt')
options=('!strip')
source=(git+https://gitlab.com/libvirt/libvirt-ocaml.git)

sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -i
  ./configure --prefix /usr# --libdir /usr/lib/ocaml
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  #install -dm755 "${pkgdir}/usr/share/"
  #mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

