# Maintainer:  Uffe Jakobsen <> microtop at starion.dk <>

pkgname=ophis-git
_pkgname=Ophis
pkgver=v2.2.r0.g6a5e5a5
pkgrel=1
epoch=
pkgdesc="cross-assembler for the 6502 series of microprocessors"
arch=('i686' 'x86_64')
url="http://michaelcmartin.github.io/Ophis/"
license=('MIT')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("ophis")
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/michaelcmartin/${_pkgname}.git)
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd ${srcdir}/${_pkgname}

  python -m build
}

check()
{
  cd ${srcdir}/${_pkgname}/tests
  python test_ophis.py
}

package()
{
  cd ${srcdir}/${_pkgname}

  python -m pip install --root=${pkgdir} -I .

  cd ${srcdir}/${_pkgname}
  install -Dm 644 "README" "${pkgdir}/usr/share/licenses/${pkgname}/README"
}

# EOF
