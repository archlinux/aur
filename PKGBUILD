# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=fdupes-jody-git
pkgver=1.51.jody4.r67.9e03e71
pkgrel=1
pkgdesc="A program for identifying or deleting duplicate files residing within specified directories with additional patches"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/fdupes-jody/"
license=('MIT')
depends=(glibc)
provides=(fdupes)
conflicts=(fdupes)
source=("${pkgname}::git+https://github.com/jbruchon/fdupes-jody.git"
        "LICENSE")
sha256sums=('SKIP'
            '38c96b27f2ca86a9c7ca0cb79faf34a4de1d03675b8c4b60d0c628b6b0f41255')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package(){
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}"/usr/{share/man/man1,bin}
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
