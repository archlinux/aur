# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: FallenWizard <fallenwizard@archlinux.us>

pkgname=tripcrunch-git
pkgver=r43.5880e46
pkgrel=1
pkgdesc="Tripcode generator intended for image boards"
arch=(x86_64)
url="https://github.com/tiikeri/tripcrunch"
license=('BSD')
makedepends=('git')

source=("git+https://github.com/tiikeri/tripcrunch.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}"/tripcrunch
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/tripcrunch
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/tripcrunch
  make DESTDIR="${pkgdir}"/ install
  install -Dm644 "${srcdir}"/tripcrunch/COPYING "${pkgdir}"/usr/share/licenses/"$pkgname"/COPYING
}
