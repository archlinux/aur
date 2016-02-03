# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=jdupes-git
pkgver=1.0.1.r182.552dd62
pkgrel=1
pkgdesc="jdupes is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes/"
license=('MIT')
depends=('glibc')
provides=('jdupes')
conflicts=('fdupes-jody-git')
source=("${pkgname}::git+https://github.com/jbruchon/jdupes.git"
        "LICENSE")
sha256sums=('SKIP'
            'ff95e2262ce1dd788e66c6c8763354e350a46044b8532d92146b7b03a319481a')

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
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
