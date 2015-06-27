# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: Raphaël Proust <raphlalou@gmail.com>

pkgname=opam-git
pkgver=1.1.0.484.g692cf53
pkgrel=1
pkgdesc="OCaml Package Manager"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://opam.ocaml.org"
license=('GPL')
depends=('ocaml' 'aspcud')
makedepends=('git' 'curl')
provides=('opam')
conflicts=('opam')
install='opam-git.install'
source=("$pkgname"::'git+git://github.com/ocaml/opam' 'opam-git.install')
md5sums=('SKIP'
         'e26e35d3f858c0b5474b778821f9d2e8')

pkgver() {
	cd "$pkgname"
	local ver="$(git describe --always)"
	printf "%s" "${ver//-/.}"
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make lib-ext -j 1
  make -j 1
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
