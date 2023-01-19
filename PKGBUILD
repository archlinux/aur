# Maintainer: Nici <NicolasVontobel at protonmail dot com>
pkgname='dvd-screensaver-sway-git'
_pkgname='dvd-screensaver-sway'
pkgver=r9.ec802e1
pkgrel=1
epoch=1
pkgdesc="Moves a floating sway window like the dvd screensaver"
arch=('any')
url="https://github.com/NiciTheNici/dvd-screensaver-sway"
license=('GPL3')
depends=()
optdepends=(
	'sway: preferred window manager'
	'i3-wm: alternative window manager'
)
makedepends=(git cargo) 
source=('git+https://github.com/NiciTheNici/dvd-screensaver-sway.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	cargo build --release
}

package() {
	cd ${_pkgname}
	install -Dm755 ./target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"

}
