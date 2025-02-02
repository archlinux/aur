# Maintainer: David Adler <d.adler@posteo.de>
pkgname=aloop-git 
pkgver=r30.738f570
pkgrel=1
pkgdesc="GUI audio file looper"
arch=('x86_64')
url="https://github.com/brummer10/aloop"
license=('BSD-3-Clause')
groups=()
depends=('libsndfile' 'portaudio' 'cairo' 'libx11')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/brummer10/aloop.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

