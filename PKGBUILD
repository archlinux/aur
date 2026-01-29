#Maintainer: Drake Strickland <drake.o.strickland at gmail dot com>

pkgname=banjorecomp-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="A static recompilation of Banjo-Kazooie"
arch=(x86_64)
url="https://github.com/${_reponame}/${_reponame}"
_reponame=BanjoRecomp
license=('GPL')
depends=()
source=(
    "https://github.com/${_reponame}/${_reponame}/releases/download/v${pkgver}/BanjoRecompiled-v${pkgver}-Linux-X64.zip"
    "https://raw.githubusercontent.com/${_reponame}/${_reponame}/v${pkgver}/icons/app.png"
    "https://raw.githubusercontent.com/${_reponame}/${_reponame}/v${pkgver}/COPYING"
    )
sha256sums=(
    e70fe3227c399f3cb460ea0d245407b5a71e810ddd86e59aa62e8b094918eda9
    SKIP
    SKIP
    )

prepare() {
	bsdtar -xf BanjoRecompiled-v1.0.0-Linux-X64.zip
	tar xvf "$srcdir/BanjoRecompiled.tar.gz"
}

package() {
	install -Dm755 BanjoRecompiled "$pkgdir/opt/${_reponame}-bin/BanjoRecompiled"
	install -Dm644 recompcontrollerdb.txt "$pkgdir/opt/${_reponame}-bin/recompcontrollerdb.txt"
	cp -r assets "$pkgdir/opt/${_reponame}-bin/"
	install -Dm644 "app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	
	# Install .desktop file
	install -Dm644 ../BanjoRecomp-bin.desktop "$pkgdir/usr/share/applications/BanjoRecomp-bin.desktop"
}
