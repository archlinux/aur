# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ManasvinYadav
_gitname=swrm
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Local-first BitTorrent TUI with a VPN kill-switch and in-app streaming"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("CONFIG_EXAMPLE-${pkgver}.yaml::${_ghurlraw}/config.example.yaml"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5fb1a8024b2f8167c39f49aa9a6d7e6429040956ffed8134fa1f1ee564f79f7c'
            '829f46fee7add6e1e70b7dc1716cd437241c9ef61e2fe2be9844804b196ad379'
            '97773d070c525e2cf9df0e500eb0c8f2e4b950ea0122f5eff4b3602f090fde81')
sha256sums_x86_64=('7d8f964e1d4623b4a0fb2a4008479929309a412e5ad1c3159d53d4dcbae8b72e')
sha256sums_aarch64=('06d59b42d6ac33aed5da93fc8613a44f9db5760cbbaf7afade290828023d226d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG_EXAMPLE-${pkgver}.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.yaml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
