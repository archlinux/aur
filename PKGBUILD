# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=clarkarch
_gitname=tfm-tui
_appname=${_gitname%-tui}
pkgname=${_appname}-bin
pkgdesc="🖱️ Modern mouse-first terminal file manager"

pkgver=1.0.0
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
		"PLUGIN_PALETTE-${pkgver}.ts::${_ghurlraw}/plugins-sample/palette.ts"
		"PLUGIN_HELLO-${pkgver}.ts::${_ghurlraw}/plugins-sample/hello.ts"
		"CONFIG-${pkgver}.toml::${_ghurlraw}/config.example.toml"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.gz")
sha256sums=('f667ce20255b2d4ff9dcb64f5b3fcf401d41846f637e5a9236f8ed365c63712d'
            'dfa54f98dafcea83b378fe1ed5d7bd84b8b95b6d2de97cbbfc0d8d6a3cc6cbaf'
            'f14cf1f2e4b37e488cb1a0b73a2043f5a2045453052a3d98a5811ea05e3fa7a9'
            'de84739bc1856ec29e9a18655aa3d99a9fdb253d7537ab1610c2a597a227e046'
            'd9da7748c6941a0a5ea0c77ffdada2b98eddd99245db443f3a78957c68b644f0'
            'cb893316ac44bc5cfe9c79fad972bc4a18738c97c793236f50006764cd4404e1'
            '5efaf718fa397709b953e58f9eec339762be389fb9806de0ef9e1a705bfaf6ba'
            'b2d4efd70a3897fa8ccfa35574c646be83ad2fd1459cf0e5661d2f48187cad4f')
sha256sums_x86_64=('d6201d96d763f16be567f56ab22c1dd523142b35b7a7ce4f1ffd2c5eb89f326c')
sha256sums_aarch64=('5d2ae3b049783377edbf5628cb19c512234c1abdd39c87fed67dc4536ee0164d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "PLUGIN_TFM_API-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/tfm-api.d.example.ts"
	install -Dm644 "PLUGIN_SHOWCASE-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/showcase.example.ts"
	install -Dm644 "PLUGIN_CONTEXT-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/context.example.ts"
	install -Dm644 "PLUGIN_PALETTE-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/palette.example.ts"
	install -Dm644 "PLUGIN_HELLO-${pkgver}.ts" "${pkgdir}/usr/share/doc/${pkgname}/plugins/hello.example.ts"

	install -Dm644 "CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.toml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
