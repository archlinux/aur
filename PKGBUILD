# Maintainer:  Popolon <popolon (oL popolon d.t org>

_pkgname=cjit
pkgname=cjit-git
pkgver=r411.2103864
pkgrel=1
pkgdesc=" C Just In Time, interpreter and compiler "
url='https://dyne.org/cjit/'
arch=($CARCH)
license=('GPL-3.0-or-later')
depends=()
provides=("cjit")
conflicts=("cjit")

source=('git+https://github.com/dyne/cjit.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr linux
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSES/GPL-3.0-or-later.txt "${pkgdir}/usr/share/licenses/${pkgname}/GPL-3.0-or-later.txt"
}
