# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=navid-m
_gitname=hexal
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modal text editor aiming to supersede Helix"

pkgver=0.3.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.zip")
sha256sums=('15be82d732c2405fe59197ac357eabe18623df56bffd4a274212970555fcafdb'
            'ddec419b3e1e15ff0e03b24e51665e2be0a6b8c39cf5071d7e939ddc56370f4f')
sha256sums_x86_64=('de23e0be8b93410dec7e0475a57f04063c0f352a6437bd385db8eb111f64774b')
sha256sums_aarch64=('b5ecdc0576dd1d88fd7dff1b391aa33473724fa3bcfa0018729e585b43648138')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}"
	cp -rfa "data" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
