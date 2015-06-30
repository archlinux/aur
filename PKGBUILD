# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=freecad-dxf
pkgver=0.r18.gd61a030
pkgrel=1
pkgdesc='make FreeCAD import DXF files'
arch=('i686' 'x86_64')
url='https://github.com/yorikvanhavre/Draft-dxf-importer'
license=('GPL')
depends=('freecad' 'python2')
makedepends=('git')
source=('freecad-dxf::git://github.com/yorikvanhavre/Draft-dxf-importer.git')
sha256sums=('SKIP')

pkgver() {
	cd freecad-dxf/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd freecad-dxf/

	for PY in *.py; do
		install -D -m0644 ${PY} ${pkgdir}/opt/freecad/Mod/Dxf/${PY}
	done
}

