# Maintainer: Jacek Wozniak <mech@themech.net>
pkgname=k81x-fkeys
pkgver=0.2_3
pkgrel=2
epoch=
pkgdesc="Logitech K810/K811 keyboard Configurator for changing the behavior of F-keys."
arch=('i686' 'x86_64')
url="https://github.com/themech/k810_k811_fkeys/"
license=('MIT')
groups=()
depends=('libsystemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
#temporarily commented out to fix the broken config
#backup=("etc/udev/rules.d/00-k81x.rules")
options=('!buildflags' '!makeflags')
install=
changelog=
source=("https://github.com/themech/k810_k811_fkeys/archive/v${pkgver//_/-}.tar.gz"
	"https://github.com/themech/k810_k811_fkeys/releases/download/v${pkgver//_/-}/v${pkgver//_/-}.tar.gz.asc")
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=('95BAF0A4346D4C0B6FDDA1767FBFBFD17A45CAE7')

build() {
	cd "k810_k811_fkeys-${pkgver//_/-}"
	make
}

package() {
	cd "k810_k811_fkeys-${pkgver//_/-}"
	install -D -m644 arch/00-k81x.rules "$pkgdir/etc/udev/rules.d/00-k81x.rules"
	install -D -m755 k81x-fkeys "$pkgdir/usr/bin/k81x-fkeys"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/Kars/LICENSE"
}
