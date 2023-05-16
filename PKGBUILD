# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/pokeclicker-bin
pkgname=pokeclicker-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="Game about catching Pokémon, defeating gym leaders, and watching numbers get bigger"
arch=('x86_64')
url="https://www.pokeclicker.com/"
license=('ISC')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib' 'ffmpeg')
optdepends=("libappindicator-gtk3: app indicator support")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("https://github.com/RedSparr0w/Pokeclicker-desktop/releases/download/v${pkgver}/${pkgname%-bin}-desktop_${pkgver}_amd64.deb"
	"LICENSE")
sha512sums=('3b0e5a602d5c5a289802065b264f38dc361969efd11d958a848a5565514c293a266656bdaaa733c30a31d8bfb5d919046d46497b45c28cb6aec67162bc3be5d0'
            '175f678bd566e35deab7cbd8af2b93bf2aaba82e9b66a73fbc9ec98f523872bf7d09b3ef599658dbc1c18d281398df7beb2f0593be8a0c720af0e5e9ea0a255e')

prepare() {
	cd "${srcdir}"
	tar xJf "data.tar.xz"
}

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "opt" "${pkgdir}"
	cp -a --reflink=auto "usr" "${pkgdir}"
	mv "${pkgdir}/opt/PokéClicker/" "${pkgdir}/opt/PokeClicker/"
	install -dm755 "${pkgdir}/usr/bin"
	ln -sf "/opt/PokeClicker/pokeclicker-desktop" "${pkgdir}/usr/bin/pokeclicker"
	chmod 4755 "${pkgdir}/opt/PokeClicker/chrome-sandbox"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
