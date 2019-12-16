# Maintainer: RedTide <redtid3@gmail.com>

prjname=wine-installer
prjcreator=linuxmint
pkgname=${prjname}-git
pkgver=r6.a751092
pkgrel=1
pkgdesc='A metapackage that provides desktop files and menus to Wine.'
arch=('x86_64')
license=('GPL3')
url="https://github.com/${prjcreator}/${prjname}"
makedepends=('git')
optdepends=('winetricks: Script to install various redistributable runtime libraries in Wine.')
depends=('wine')
conflicts=('wine-installer')
source=("${pkgname}"::"git+https://github.com/${prjcreator}/${prjname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
package() {
  cd "${pkgname}"
  cp -r usr "${pkgdir}"
  cp -r etc "${pkgdir}"
}
