# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ManasvinYadav
_gitname=swrm
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Local-first BitTorrent TUI with a VPN kill-switch and in-app streaming"

pkgver=0.1.1
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
sha256sums=('2bef7a5b3dcbbe32c8cbd2563b5e6214271f04acedcc44369fb24528113b4f28'
            'ce2bbf0cdd7f018fab4449569af7c675350f60779ba7ce689b1f2c4115c7710c'
            '97773d070c525e2cf9df0e500eb0c8f2e4b950ea0122f5eff4b3602f090fde81')
sha256sums_x86_64=('d1f8e150a45e4158f60dc9122f334605014326485b3f2f01243e6f1e7bb10034')
sha256sums_aarch64=('72cd278cd9193ad18a7d45c7ab17df46310ab9bf19fd26a7c0b5dd93d66caead')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG_EXAMPLE-${pkgver}.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.yaml"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
