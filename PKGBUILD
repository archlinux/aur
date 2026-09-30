# Maintainer: Drake Strickland <drake.o.strickland at gmail dot com>

pkgname=dk64recompiled-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A static recompilation of Donkey Kong 64"
arch=("x86_64" "aarch64")
_reponame=Donkey-Kong-64-Recompiled
url="https://github.com/Rainchus/${_reponame}"
_raw_url="https://raw.githubusercontent.com/Rainchus/${_reponame}/refs/tags/v${pkgver}"
license=('GPL-3.0-only')
depends=(
    "sdl2"
    "freetype2"
    "gtk3"
    "vulkan-driver"
    "libice"
    "libsm"
    )

source_x86_64=(https://github.com/Rainchus/Donkey-Kong-64-Recompiled/releases/download/v${pkgver}/DK64Recompiled-Linux-X64-Release-${pkgver//./-}.zip)
sha256sums_x86_64=('352380418f2376640825fe65b0ba085e12e7b792205cfa435a6caa0202e54b5c')

source_aarch64=(https://github.com/Rainchus/Donkey-Kong-64-Recompiled/releases/download/v${pkgver}/DK64Recompiled-Linux-ARM64-Release-${pkgver//./-}.zip)
sha256sums_aarch64=('bb887245c61ee08f98c2e724ec2b3877000a02554bd501a122bd91409c888ba4')

source=(
    "${_raw_url}/icons/app.png"
    "${_raw_url}/COPYING"
    "${_raw_url}/LICENSE"
    "DK64Recompiled-bin.desktop"
    "dk64recompiled" # A wrapper script
    )

sha256sums=('b743cafe4f3e19dba6aad4c17af833b62ff758af0390d13eec3303f166893f6b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '97eac7320689af1821d123cfb4b409c7fa1fa5009b2a1261c6aa8f129e43bf51'
            '0cec4b28ec745bb8636fa6bb5996578a07ab1ebeb2bdc5da5bf088ac04df0efa')

prepare() {
	# This is needed because the initial download is a .zip
	bsdtar -xf DK64Recompiled.tar.gz
}

package() {
	install -Dm755 DK64Recompiled "$pkgdir/opt/${_reponame}-bin/DK64Recompiled"
	install -Dm644 recompcontrollerdb.txt "$pkgdir/opt/${_reponame}-bin/recompcontrollerdb.txt"
	cp -r assets "$pkgdir/opt/${_reponame}-bin/"

	# Install icon
	install -Dm644 "app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	
	# Install Licenses
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	# Install .desktop file
	install -Dm644 DK64Recompiled-bin.desktop "$pkgdir/usr/share/applications/DK64Recompiled-bin.desktop"
	
	# Install wrapper script to allow running from terminal using 'dk64recompiled'
	install -Dm755 dk64recompiled "$pkgdir/usr/bin/dk64recompiled"
}
