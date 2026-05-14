# Maintainer: kumen
pkgname=kicad-interactive-html-bom-plugin
_name=InteractiveHtmlBom
pkgver=2.11.1
pkgrel=2
pkgdesc="Interactive HTML BOM generation plugin for KiCAD"
arch=('i686' 'x86_64')
url="https://github.com/openscopeproject/InteractiveHtmlBom"
license=('MIT')
depends=('python-wxpython' 'python-jsonschema')
optdepends=('kicad' 'eagle')
source=("https://github.com/openscopeproject/${_name}/archive/v${pkgver}.tar.gz"
        "${pkgname}")
sha256sums=('74905074c5ed31c53db1f1829da1c13232542242062f1ebb0f80af685664e574'
            'b2a2b614c0995d5508c09fe9e309ca1e756fed71af38ed222cde7215f8fd7171')

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
