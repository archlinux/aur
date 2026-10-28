# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=m-uvex
_gitname=loaf-fm
_appname=${_gitname%-fm}
pkgname=${_gitname}-bin
pkgdesc="Material 3 Expressive File Manager built with Qt6 Quick and Rust"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'hicolor-icon-theme')
optdepends=('7zip: zip/7z/rar/iso and encrypted archives'
            'udisks2: mount, eject and unlock drives'
            'ffmpegthumbnailer: video thumbnails'
            'xdg-utils: open files with their default application'
            'libsecret: remember encrypted drive passphrases'
            'polkit: Open as Administrator')

options=('!strip')

# source=("README-${pkgver}.md::${_ghurlraw}/README.md"
# 		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tzst::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
sha256sums_x86_64=('e578c2ef4b1d70b606751a7ef9be090c8fb07685d70f6e30750796ef53f213b7')

noextract=("${source_x86_64[@]%%::*}")

package() {
	cd "${pkgdir}"

	tar --exclude=".*" -xf "${srcdir}/${_appname}-${CARCH}-${pkgver}.tzst"

	mv "${pkgdir}/usr/share/doc/${_appname}/" "${pkgdir}/usr/share/doc/${pkgname}/"
	mv "${pkgdir}/usr/share/licenses/${_appname}/" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
