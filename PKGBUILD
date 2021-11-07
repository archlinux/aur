# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulse-vumeter-git
_pkgname=pulse-vumeter
pkgver=0.11.r0.db03acc
pkgrel=1
pkgdesc="A pulseaudio cli vumeter"
url="https://github.com/theRealCarneiro/pulse-vumeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libpulse')
provides=('pulse-vumeter')
makedepends=('git' 'libpulse' 'make')
optdepends=('pipewire-pulse' 'pulseaudio')
source=(${_pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver(){
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g; s/.//')"
}

build() {
	cd $_pkgname
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}

