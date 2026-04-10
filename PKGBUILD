# Maintainer: kumen
pkgname=kicad-interactive-html-bom-plugin
_name=InteractiveHtmlBom
pkgver=2.11.1
pkgrel=1
pkgdesc="Interactive HTML BOM generation plugin for KiCAD"
arch=('i686' 'x86_64')
url="https://github.com/openscopeproject/InteractiveHtmlBom"
license=('MIT')
depends=('python-wxpython' 'python-jsonschema')
optdepends=('kicad' 'eagle')
source=("https://github.com/openscopeproject/${_name}/archive/v${pkgver}.tar.gz"
        "${pkgname}")
sha256sums=('74905074c5ed31c53db1f1829da1c13232542242062f1ebb0f80af685664e574'
            'd1cb8382b1e63c2afcc1b44fda35e888808765c72ba00a225ad74428ab5e2136')

package() {
  cd "$srcdir/${_name}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/kicad/scripting/plugins"
  cp -R "${_name}/" "${pkgdir}/usr/share/kicad/scripting/plugins"
  
	# Installing binary files
	install -dm 755 "${pkgdir}/usr/bin/"
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/generate_interactive_bom"

	# Installing license files
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
# vim:set ts=2 sw=2 et:
