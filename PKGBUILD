# Maintainer: dllud <dllud riseup net>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=id3-git
pkgver=r569.51e738e
pkgrel=2
pkgdesc="id3 mass tagger lists and manipulates ID3 and Lyrics3 tags in multiple files. Patched to avoid replacement of dot characters."
url="https://squell.github.io/id3/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gcc-libs')
makedepends=('git')
conflicts=('id3')
options=('!makeflags')
source=("$pkgname::git+https://github.com/squell/id3.git"
        "do-not-replace-dots.patch")
md5sums=('SKIP'
         '162c7882a19f45003e62013427bfea8c')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -Np1 -i "${srcdir}/do-not-replace-dots.patch"
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
