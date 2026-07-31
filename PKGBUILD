# Maintainer: Drake Strickland <drake.o.strickland at gmail dot com>

pkgname=banjorecomp-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A static recompilation of Banjo-Kazooie"
arch=("x86_64" "aarch64")
url="https://github.com/BanjoRecomp/BanjoRecomp"
_reponame=BanjoRecomp
license=('GPL-3.0-only')
depends=(
    "sdl2"
    "freetype2"
    "gtk3"
    "vulkan-driver"
    "libice"
    "libsm"
    )

source_x86_64=(https://github.com/${_reponame}/${_reponame}/releases/download/v${pkgver}/BanjoRecompiled-v${pkgver}-Linux-X64.tar.gz)
sha256sums_x86_64=('a34a4d361221171ea638e0165301fff817c53b9cd46167c5affd37867cfc7ad0')

source_aarch64=(https://github.com/${_reponame}/${_reponame}/releases/download/v${pkgver}/BanjoRecompiled-v${pkgver}-Linux-ARM64.tar.gz)
sha256sums_aarch64=('53515be8bc453bc32ed8cbc72e3cd06350ab4a28bd94b0aa6499d4b963a83757')

source=(
    "https://raw.githubusercontent.com/${_reponame}/${_reponame}/v${pkgver}/icons/app.png"
    "https://raw.githubusercontent.com/${_reponame}/${_reponame}/v${pkgver}/COPYING"
    "BanjoRecomp-bin.desktop"
    "banjorecompiled" # A wrapper script
    )

sha256sums=(
    '991e10bb4ad6ef405e3027f91fee901db2fbc3ac795b9958b925bbdd68c417f5'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
    'c2b97d9fc823a8d80e833d48964fabc0c2b5a267ca7a7c901451385527b1e553'
    'ace4d1ff74277a25d23d1a2d6b357577c8d0e1deafd5c8594a8e31f306b34925'
    )

package() {
	install -Dm755 BanjoRecompiled "$pkgdir/opt/${_reponame}-bin/BanjoRecompiled"
	install -Dm644 recompcontrollerdb.txt "$pkgdir/opt/${_reponame}-bin/recompcontrollerdb.txt"
	cp -r assets "$pkgdir/opt/${_reponame}-bin/"
	install -Dm644 "app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	
	# Install .desktop file
	install -Dm644 BanjoRecomp-bin.desktop "$pkgdir/usr/share/applications/BanjoRecomp-bin.desktop"
	
	# Install wrapper script to allow running from terminal using 'banjorecompiled'
	install -Dm755 banjorecompiled "$pkgdir/usr/bin/banjorecompiled"
}
