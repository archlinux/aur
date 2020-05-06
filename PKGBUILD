# Contributor: K. Piche <kpiche <at> rogers <dot> com>
# Maintainer: Jenya Sovetkin <e.sovetkin <at> gmail <dot> com>
pkgname=ripmime-git
pkgver=r13.a556ffe
pkgrel=2
arch=(any)
license=('BSD')
pkgdesc="Tool to extract the attached files out of a MIME package"
url="https://github.com/inflex/ripMIME"
source=('git+https://github.com/inflex/ripMIME')
md5sums=('SKIP')
makedepends=('git')

_gitname=ripMIME

pkgver() {
  cd "${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  make || return 1
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/man/man1"
  make LOCATION="${pkgdir}/usr" install
}
