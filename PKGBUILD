# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=1.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"DESIGN-${pkgver}.md::${_ghurlraw}/docs/DESIGN.md"
		"DOCUMENTATION-${pkgver}.md::${_ghurlraw}/docs/README.md"
		"TIGER_STYLE-${pkgver}.md::${_ghurlraw}/docs/TIGER_STYLE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('a9e7a0b2ca0bb923c316c0cc1b9f60e8407ebbeb974467cea6b808644b5dd611'
            '9be764fb77b414c10e4b986321dcc01f2c60004c124d3188d57b10595c9f5749'
            '9999e155b2d279c61de6a5ebf764ed3a8529dca53bbbee11caae4d3fdaaef3ca'
            '3817ea060493327e03aa569acf524a1000038c82783d11f36e80251ac0619608'
            'ef10bbdfbb5f0601d6e6e9eaf699c4b882564267ba5743bb9359fb9f89d2a60b')
sha256sums_x86_64=('deae7fa47471675159b3f48c2fb8c2e963629bbbb6bf1cb9b7e45c510dba9df9')
sha256sums_aarch64=('ebbd45e8eea52f0806778d662a6319762b0066ccb5928cd3f936663eab545edc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "TIGER_STYLE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TIGER_STYLE.md"
	install -Dm644 "DOCUMENTATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
