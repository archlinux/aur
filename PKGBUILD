# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=openspin-git
_gitname=OpenSpin
pkgver=1.00.78.r14.gd1991aa
pkgrel=1
pkgdesc="Open Source Spin interpreter for the Parallax Propeller"
arch=('x86_64' 'i686')
url="https://github.com/parallaxinc/OpenSpin"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("${pkgname}" 'openspin')
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
  make
}

package()
{
  cd "${srcdir}/${_gitname}"
  install -Dm 755 build/openspin "${pkgdir}/usr/bin/openspin"
  touch LICENSE
  install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#
# EOF
#
