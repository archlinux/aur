# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=shripad-jyothinath
_gitname=procharbor
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightweight native Linux task manager and system monitor"

pkgver=1.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('bash' 'python' 'python-gobject' 'python-cairo' 'gtk4' 'glib2' 'pango' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.deb")
sha256sums=('dace5d75aa74255574853d0dadadcb8e0361d43ecb4cf89dfa3b6f80aa88d0aa'
            '72a73e967eb112cd8dce4ac0ea1d101f481b21cf1662173c6d98d4a1f85433f3')
sha256sums_x86_64=('7720c76d4fc06bf32c78c1e55b4b9a171e735749ef2921b5779db810b0cf154e')
sha256sums_aarch64=('700b229a2d20501d68321ae5e0bd25b4a53d041a2ddc6c9d8bd5f2057345bc70')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.zst" --exclude="usr/share/doc"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
