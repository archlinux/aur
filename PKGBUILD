# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=jlc-kicad-tools-git
_pkgname=jlc-kicad-tools
pkgver=v1.0.5
_ver="1.0.5"
pkgrel=2
pkgdesc="Tool for using JLCPCB assembly service with KiCad "
arch=('any')
url="https://github.com/matthewlai/JLCKicadTools"
license=('GPL3')
depends=('python>=3.6.0' 'python-logzero')
makedepends=('git')
provides=("jlc-kicad-tools=${pkgver}")
conflicts=("jlc-kicad-tools")
source=("git+https://github.com/matthewlai/JLCKicadTools.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/JLCKicadTools"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "v%s_r%s.%s" "${_ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
  cd "${srcdir}/JLCKicadTools"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
