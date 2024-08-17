# Maintainer: Michael Clark <iiridayn@gmail.com>
pkgname=pico-tts
pkgver=0.1.2
pkgrel=1
pkgdesc="lib and unix binary for text-to-speech engine from Android"
arch=('x86_64')
url="https://github.com/Iiridayn/pico-tts"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("git+$url.git#tag=$pkgver"
       "git+https://android.googlesource.com/platform/external/svox")
sha256sums=("SKIP" "SKIP")

prepare() {
	cd "$pkgname"
	git config submodule.svox.url "${srcdir}/svox"
	git submodule--helper update
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	# https://wiki.archlinux.org/title/PKGBUILD#license
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
