# Maintainer: Mustafa Gezen <mustiigezen@gmail.com>
pkgname=("zx-git")
srcname="zx"
pkgver=r23.1457726512.fa04baf
pkgrel=1
pkgdesc="i3 scratchpad manager"
arch=("any")
url="https://github.com/mstg/zx"
license=('MIT')
depends=("glib2" "i3ipc-glib-git" "pango" "cairo")
makedepends=("libxcb")
source=("${srcname}::git+https://github.com/mstg/zx.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${srcname}"

  printf 'r%s.%s.%s\n' \
      "$( git rev-list --count 'HEAD' )" \
      "$( git log --max-count='1' --pretty='format:%ct' )" \
      "$( git rev-parse --short 'HEAD' )"
}

build() {
  cd "${srcdir}/${srcname}"
  autoreconf --install --force --warnings='all'
  ./configure --prefix='/usr'

  make
}

package() {
  cd "${srcdir}/${srcname}"

  make DESTDIR="${pkgdir}" install
}
