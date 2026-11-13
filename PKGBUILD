# Maintainer: Drackrath <datenschutz at ai-krieger dot de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.2.5
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
depends=('glibc' 'libgcc' 'xz' 'bzip2' 'openssl' 'vulkan-driver' 'vulkan-icd-loader')
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
sha256sums=('ea0ffeae23469a8881edb59a2627a68cd9f74ec7bd62164b5229e0272731ae49'
            'f2be9195b5ecdd8f2b71db80d4794361f90a2bdb91894f3c811f025c6578db5b')
sha256sums_x86_64=('168b38894d225a3a014d126180566bca11509df26c85b4bd5a10307457262d61')
sha256sums_aarch64=('ba80725a2a31602bd5584fa1205daf0c8907dcd5f960e27fc1c792526d3b295f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
