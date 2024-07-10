# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=propbasic-git
_gitname=PropBASIC
pkgver=1.44.2.r5.g91174c0
pkgrel=1
pkgdesc="A BASIC compiler for the Parallax Propeller microcontroller"
arch=('x86_64' 'i686')
url="https://github.com/parallaxinc/PropBASIC"
license=('LicenseRef-MIT')
groups=()
depends=()
makedepends=('fpc')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/parallaxinc/${_gitname}")
sha256sums=('SKIP')


pkgver()
{
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${_gitname}"
	make linux
}

package()
{
	cd "${srcdir}/${_gitname}"
  install -Dm 755 "propbasic" "${pkgdir}/usr/bin/propbasic"
  install -Dm 755 "PropBasic" "${pkgdir}/usr/bin/PropBasic"
  install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  cp -R example "${pkgdir}/usr/share/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  cp doc/*.pdf "${pkgdir}/usr/share/doc/${pkgname}/"
}

#
# EOF
#
