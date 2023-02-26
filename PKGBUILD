# Maintainer: Anastasios Vacharakis <archlinux@vacharakis.de>

pkgname=steamdeck-gyrodsu
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool for enabling gyroscopic controls on Steam Deck."
arch=('x86_64')
url="https://github.com/kmicki/SteamDeckGyroDSU"
license=('MIT')
depends=('unzip')
source=("https://github.com/kmicki/SteamDeckGyroDSU/releases/latest/download/SteamDeckGyroDSUSetup.zip")
sha256sums=('SKIP')

build() {
	unzip -o "${srcdir}/SteamDeckGyroDSUSetup.zip"
	sed -i 's|ExecStart=%h/sdgyrodsu/sdgyrodsu|ExecStart=/usr/bin/sdgyrodsu|' "${srcdir}/SteamDeckGyroDSUSetup/sdgyrodsu.service"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	cp "${srcdir}/SteamDeckGyroDSUSetup/sdgyrodsu" "${pkgdir}/usr/bin/sdgyrodsu"
	cp "${srcdir}/SteamDeckGyroDSUSetup/sdgyrodsu.service" "${pkgdir}/usr/lib/systemd/system/"
}
