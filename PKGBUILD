# Maintainer: dllud <dllud riseup net>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=id3-git
pkgver=r569.51e738e
pkgrel=1
pkgdesc="id3 mass tagger is a tool for listing and manipulating ID3 and Lyrics3 tags in multiple files."
url="https://squell.github.io/id3/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gcc-libs')
makedepends=('git')
conflicts=('id3')
options=('!makeflags')
source=("$pkgname::git+https://github.com/squell/id3.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 }

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man" install

  #install license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
