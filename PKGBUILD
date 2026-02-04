#Maintainer: Drake Strickland <drake.o.strickland at gmail dot com>

pkgname=banjorecomp-bin
pkgver=1.0.1
pkgrel=3
pkgdesc="A static recompilation of Banjo-Kazooie"
arch=("x86_64" "aarch64")
url="https://github.com/BanjoRecomp/BanjoRecomp"
_reponame=BanjoRecomp
license=('GPLv3')
depends=()

source_x86_64=(BanjoRecompiled-v${pkgver}.zip::https://github.com/${_reponame}/${_reponame}/releases/download/v${pkgver}/BanjoRecompiled-v${pkgver}-Linux-X64.zip)
source_aarch64=(BanjoRecompiled-v${pkgver}.zip::https://github.com/${_reponame}/${_reponame}/releases/download/v${pkgver}/BanjoRecompiled-v${pkgver}-Linux-ARM64.zip)
source=(
    "https://raw.githubusercontent.com/${_reponame}/${_reponame}/v${pkgver}/icons/app.png"
    "https://raw.githubusercontent.com/${_reponame}/${_reponame}/v${pkgver}/COPYING"
    "BanjoRecomp-bin.desktop"
    )

sha256sums_x86_64=(e315303c34f4e5fa54fa4b507a63fb19766182a257b5b50302bb8d7a7b1847a6)
sha256sums_aarch64=(81be04f4027df8618e5788849789664a29086c6dc3409ebabf115a791d003faf)
sha256sums=(
    SKIP
    SKIP
    SKIP
    )

prepare() {
	bsdtar -xf BanjoRecompiled-v${pkgver}.zip
	tar xvf "$srcdir/BanjoRecompiled.tar.gz"
}

package() {
	install -Dm755 BanjoRecompiled "$pkgdir/opt/${_reponame}-bin/BanjoRecompiled"
	install -Dm644 recompcontrollerdb.txt "$pkgdir/opt/${_reponame}-bin/recompcontrollerdb.txt"
	cp -r assets "$pkgdir/opt/${_reponame}-bin/"
	install -Dm644 "app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	
	# Install .desktop file
	install -Dm644 BanjoRecomp-bin.desktop "$pkgdir/usr/share/applications/BanjoRecomp-bin.desktop"
}
