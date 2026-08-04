# Maintainer: kumen
pkgname=kicad-interactive-html-bom-plugin
_name=InteractiveHtmlBom
pkgver=2.11.2
pkgrel=1
pkgdesc="Interactive HTML BOM generation plugin for KiCAD"
arch=('i686' 'x86_64')
url="https://github.com/openscopeproject/InteractiveHtmlBom"
license=('MIT')
depends=('python-wxpython' 'python-jsonschema')
optdepends=('kicad' 'eagle')
source=("https://github.com/openscopeproject/${_name}/archive/v${pkgver}.tar.gz"
        "${pkgname}")
sha256sums=('d1032212106a5744c84401d908019e8dd430ed6309a0531f82ef514907966607'
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
