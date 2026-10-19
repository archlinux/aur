# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=clarkarch
_gitname=tfm-tui
_appname=${_gitname%-tui}
pkgname=${_appname}-bin
pkgdesc="🖱️ Modern mouse-first terminal file manager"

pkgver=1.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

url="https://${_gitauthor}.github.io/${_gitname}/"
_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("PLUGIN_TFM_API-${pkgver}.ts::${_ghurlraw}/plugins-sample/tfm-api.d.ts"
		"PLUGIN_SHOWCASE-${pkgver}.ts::${_ghurlraw}/plugins-sample/showcase.ts"
		"PLUGIN_CONTEXT-${pkgver}.ts::${_ghurlraw}/plugins-sample/context.ts"
		"PLUGIN_HELLO-${pkgver}.ts::${_ghurlraw}/plugins-sample/hello.ts"
		"CONFIG-${pkgver}.toml::${_ghurlraw}/config.example.toml"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.gz")
sha256sums=('f667ce20255b2d4ff9dcb64f5b3fcf401d41846f637e5a9236f8ed365c63712d'
            'dfa54f98dafcea83b378fe1ed5d7bd84b8b95b6d2de97cbbfc0d8d6a3cc6cbaf'
            'f14cf1f2e4b37e488cb1a0b73a2043f5a2045453052a3d98a5811ea05e3fa7a9'
            'd9da7748c6941a0a5ea0c77ffdada2b98eddd99245db443f3a78957c68b644f0'
            'e76dc74f3a2d18002ebe4273b4e044a5a03c9aa5bd3bf552c91471fecdc4c601'
            '1a1cfef34f4ceb5f6433f18293db05a8ea732d2bbe02608ecbd4552e0e847103'
            'b2d4efd70a3897fa8ccfa35574c646be83ad2fd1459cf0e5661d2f48187cad4f')
sha256sums_x86_64=('b3d9a7cf8855501d79cbef230eedc730ec8a84acaaa8cf5b33be5cd9282c6d0e')
sha256sums_aarch64=('03643e71718fdeabf15b1ca90e7f4a85119aaec013c6489b0c2cbf2fa9430e1f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "PLUGIN_TFM_API-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/tfm-api.d.example.ts"
	install -Dm644 "PLUGIN_SHOWCASE-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/showcase.example.ts"
	install -Dm644 "PLUGIN_CONTEXT-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/context.example.ts"
	install -Dm644 "PLUGIN_HELLO-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/hello.example.ts"

	install -Dm644 "CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.toml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
