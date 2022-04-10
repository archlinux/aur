# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('anime4k')
conflicts=('anime4k')
pkgver=r415.0ec6859
pkgname=anime4k-git
pkgrel=1
pkgdesc="A High-Quality Real Time Upscaler for Anime Video"
arch=('any')
depends=()
makedepends=('go-md2man')
url="https://github.com/bloc97/Anime4K#anime4k"
options=()
license=('MIT')
source=('anime4k::git+https://github.com/bloc97/Anime4K')
sha512sums=('SKIP')

pkgver() {
  cd anime4k
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"
  go-md2man -in anime4k/md/GLSL_Instructions_Linux.md -out glsl.man
  go-md2man -in anime4k/md/GLSL_Instructions_Advanced.md -out glsladv.man
}

package() {
  cd "${pkgdir}"
  install -d "${pkgdir}"/usr/share/anime4k
  install -d "${pkgdir}"/usr/share/man/man1
  install "${srcdir}"/glsl.man -m 644 "${pkgdir}"/usr/share/man/man1/anime4k.1
  install "${srcdir}"/glsladv.man -m 644 "${pkgdir}"/usr/share/man/man1/anime4k-advanced.1
  cp -rf "${srcdir}"/anime4k/glsl/. "${pkgdir}"/usr/share/anime4k/.
  cp -rf "${srcdir}"/anime4k/tensorflow/. "${pkgdir}"/usr/share/anime4k/tensorflow
}
