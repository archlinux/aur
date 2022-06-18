# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha1sums are to be generated
pkgname=freecad-linkstage3-bin
pkgdesc='A general purpose 3D CAD modeler - Daily build of LinkDaily branch'
pkgrel=1
arch=(x86_64)
url='http://www.freecadweb.org/'
license=('LGPL')
conflicts=('freecad')
depends=(
	# Copied from Freecad package
	'boost-libs' 'curl' 'opencascade>=7.2' 'openmpi' 'xerces-c' 'libspnav' 'glew' 'netcdf' 'utf8cpp'
	'shared-mime-info' 'hicolor-icon-theme' 'jsoncpp' 'qt5-base' 'qt5-declarative'
	'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-webkit' 'med'
	'python-pivy' 'pyside2' 'python-matplotlib' 'pyside2-tools' 'shiboken2'
)

## BEGIN generated variables
pkgver=2022.06.17.edge.r2.gbd42d5caa2
sha1sums=('218b7d5b3684e7daf0c4234bcd857f3df16121d3')

## END generated variables

source=("$pkgname-$pkgver.tar.gz::https://github.com/Bonnee/freecad-build-arch/releases/download/${pkgver}/freecad-archive.tar.gz")

package() {
	# Symlink to /usr/bin
	cd "$pkgdir"
	mv "$srcdir/usr" "usr"
	
	install -dm755 "usr/bin"
	ln -sf "/usr/lib/freecad/bin/FreeCAD"       "usr/bin/freecad"
	ln -sf "/usr/lib/freecad/bin/FreeCAD"       "usr/bin/FreeCAD"
	ln -sf "/usr/lib/freecad/bin/FreeCADCmd"    "usr/bin/freecadcmd"
	ln -sf "/usr/lib/freecad/bin/FreeCADCmd"    "usr/bin/FreeCADCmd"
	
	# Move data from /usr/lib/freecad/share to /usr/share
	mv "usr/lib/freecad/share/"{icons,pixmaps,mime,metainfo,applications,thumbnailers} \
	    "usr/share"
	
	rmdir "usr/lib/freecad/share"
}

