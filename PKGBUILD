# Maintainer: Drackrath <datenschutz at ai-krieger dot de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later' 'MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'xz' 'dbus' 'vulkan-driver' 'vulkan-icd-loader')
optdepends=('lib32-vulkan-driver: 32-bit Windows games via Proton (multilib)'
            'lib32-vulkan-icd-loader: 32-bit Windows games via Proton (multilib)'
            'lib32-freetype2: fonts in 32-bit Windows games (multilib)'
            'lib32-wayland: Wayland driver for 32-bit Windows games (multilib)'
            'steam: Steamworks bridge for games that need the Steam client')
install=aurelia.install

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('b55f0492bab5d28e4065885767292d87ef5bb71357f91b437f24d33d1d6104dd'
            'f2be9195b5ecdd8f2b71db80d4794361f90a2bdb91894f3c811f025c6578db5b')
sha256sums_x86_64=('d9c5c3a7b66ac2090038973697b3e6069c0fbe3e16607f87191900d7b3e2dc4a')
sha256sums_aarch64=('467f18a3767c88cb2c9254d8c1d53d39ae99db1b316c77b0e01a38e49ca2c4b3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
