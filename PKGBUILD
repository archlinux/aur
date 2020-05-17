# Maintainer: Łukasz Mariański <lmarianski@protonmail.com>
pkgname=lv2-speech-denoiser-git
pkgver=04cfba9
pkgrel=1
epoch=
pkgdesc=""
arch=('x86_64')
url="https://github.com/lucianodato/speech-denoiser"
license=('LGPL-3.0')
groups=()
depends=()
makedepends=("glibc" "git" "meson" "lv2")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# source=()
# noextract=()
# md5sums=()
validpgpkeys=()

prepare() {

	if [ -d "speech-denoiser" ]; then rm -Rf speech-denoiser; fi

	git clone -n https://github.com/lucianodato/speech-denoiser.git
	cd speech-denoiser
	
	git config --local advice.detachedHead false
	git checkout $pkgver 

	head -n -1 install.sh > install_new.sh
}

build() {
	cd speech-denoiser
	# chmod +x install.sh && ./install.sh
	chmod +x install_new.sh && ./install_new.sh
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd speech-denoiser/build

	# make DESTDIR="$pkgdir/" install
	DESTDIR="$pkgdir/" ninja install
}
