# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=0.1.0
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
		"TIGER_STYLE-${pkgver}.md::${_ghurlraw}/docs/TIGER_STYLE.md"
		"IMPLEMENTATION_NOTES-${pkgver}.md::${_ghurlraw}/docs/IMPLEMENTATION_NOTES.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('a9e7a0b2ca0bb923c316c0cc1b9f60e8407ebbeb974467cea6b808644b5dd611'
            '29427708d3f4ab06f7a6cc52a4aa98ae172fd63b3b29dd187ac65c576289a3cf'
            '2d9b7be38f7949a0ba7e80fecd4d77e31c541c08b36609906c19517101bd7a61'
            'ca5427faf8d0dcf3cce068516c9fc2aa90674adba8fdbcde62935f76c4d053df'
            '09500fc4f8fdfc062de1c8bb65bb7960d6523aa567963e25bdcdc44b228dd43d'
            '8a4e8723d71b3b5820adaafe4a6c4d1eb816faab0547fa6eba9444f9f9fbe072')
sha256sums_x86_64=('46d5537597b94d528e117576c61ea80acc9863aa7b60a5463c08a14a28fa8636')
sha256sums_aarch64=('d3fcd02eab7924507185d1cafa9f900eeff1bbf6b5510767701d16ef7580dfc5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "TIGER_STYLE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TIGER_STYLE.md"
	install -Dm644 "DOCUMENTATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATIONmd"
	install -Dm644 "IMPLEMENTATION_NOTES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/IMPLEMENTATION_NOTES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
