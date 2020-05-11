# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=gp-saml-gui
pkgname=$_name-git
pkgver=r24.6133ffe
pkgrel=2
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
	'2db9e1cfee4c059fdd84c682ff3aeadb63cd6fddbb2963718f0d3c4520ee609dcc930eb4072096fa2ad651c00ac36e6d2ca4859fe9225aa9002d893b927b7878')

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
