# Maintainer: Stephen Hassard <steve@hassard.net>
pkgname="sdorfehs-git"
_pkgname="${pkgname%%-*}"
pkgver=1670.fb30a72
pkgrel=1
pkgdesc="sdorfehs is a tiling window manager descended from ratpoison."
arch=('x86_64')
url="https://github.com/jcs/sdorfehs"
license=('GPL2')
depends=('libxft' 'libxres')
source=("${_pkgname}::git+https://github.com/jcs/sdorfehs.git#branch=master"
        "${_pkgname}.desktop")
b2sums=('SKIP'
        '6e2774bf0c0618684c95bfb29c83b3cf2db8a4e389fb40c035d09ea987e6ddc5f98cbc0d2f5f3f3afc1db70a5ee8a175e94751e2b9fcee6fb37bb949eab8db7d')

pkgver() {
  cd "$srcdir/${_pkgname}"

  printf "%s.%s" \
    $(git rev-list --count HEAD) \
    $(git rev-list --max-count=1 HEAD | cut -c1-7)
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/etc/X11/sessions/${_pkgname}.desktop"
}
