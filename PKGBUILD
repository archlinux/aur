# -*- mode: pkgbuild -*-
# Maintainer  : Youssef Fathy <youssefessamasu@gmail.com>

pkgname=quran-companion
_pkgname=quran-companion
pkgver=1.2.0
pkgrel=2
pkgdesc="Cross-platform desktop offline Quran reader and player (binary release)"
arch=('x86_64')
url="https://github.com/0xzer0x/quran-companion"
license=('LGPL3')
depends=(fuse2)
makedepends=()
provides=(quran-companion)
conflicts=(quran-companion-git)
source=("https://github.com/0xzer0x/quran-companion/releases/download/v${pkgver}/Quran_Companion-${pkgver}-x86_64.AppImage")
md5sums=("89d4d5c4452f8e2b5cb3c63e15b83bfd")
options=(!strip)

prepare() {
	chmod +x "${srcdir}/Quran_Companion-${pkgver}-x86_64.AppImage"
	"${srcdir}/Quran_Companion-${pkgver}-x86_64.AppImage" --appimage-extract usr/share
}

package() {
	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/bin"

	install -Dm755 "${srcdir}/Quran_Companion-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/quran-companion/quran_companion.AppImage"
	cp -r "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr/"

	ln -sf /opt/quran-companion/quran_companion.AppImage "${pkgdir}/usr/bin/quran-companion"
}
