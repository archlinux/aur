# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=gp-saml-gui
pkgname=$_name-git
pkgver=r57.17b2ca6
pkgrel=1
pkgdesc='Interactively authenticate to GlobalProtect VPNs that require SAML'
arch=(any)
url="https://github.com/dlenski/$_name"
license=('GPL3')
provides=($_name)
conflicts=($_name)
depends=('python' 'python-requests' 'webkit2gtk' 'python-gobject')
makedepends=('git')
source=("${_name}::git+${url}" 'gp-saml-gui.sh')
b2sums=('SKIP'
        '5015928286f6a71327568ecaf92d2fc60360ca6eb3499a99ebc4613fc2655004ff9109b67174d3e63fc7adbf9e5f1a2d884edefc7b0fbe87689653f79f6ce6e5')

pkgver() {
	cd "${srcdir}/${_name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_name"
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	cp -r "${srcdir}/${_name}/"* "${pkgdir}/usr/lib/${_name}"

	install -dm 755 "${pkgdir}/usr/bin"
	install -m 755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"
}
