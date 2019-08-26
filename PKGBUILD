# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=onesixtyone-git
_gitname='onesixtyone'
pkgver=r45.742b1a3
pkgrel=1
pkgdesc='Fast SNMP scanner'
arch=(any)
url='https://github.com/trailofbits/onesixtyone'
license=(GPL)
depends=('python-colorama' 'python-toml')
conflicts=(onesixtyone)
provides=(onesixtyone)
source=("${_gitname}::git+https://github.com/trailofbits/onesixtyone.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"

  gcc -o onesixtyone onesixtyone.c
}

package() {
  cd "${srcdir}/${_gitname}"
  
  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${_gitname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${_gitname}/"
  install -v -m755 ${_gitname} "${pkgdir}/usr/bin/${_gitname}"
}

# vim:set ts=2 sw=2 et:
