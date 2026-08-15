# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>
pkgname=grimfreeze-git
_pkgname=grimfreeze
pkgver=6ce568219c9f
pkgrel=1
license=('MIT')
pkgdesc='Grab images from a Wayland compositor, with freeze selection'
makedepends=("meson" "scdoc" "git")
depends=(
	"pango"
	"wayland"
	"wayland-protocols"
	"libjpeg-turbo"
)
arch=("i686" "x86_64")
url='https://github.com/DreamMaoMao/grim-freeze'
source=("${pkgname%-*}::git+https://github.com/DreamMaoMao/grimfreeze.git")
sha1sums=('SKIP')
provides=('grim')
conflicts=('grim' 'grim-git')
options=(debug !strip)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git rev-parse --short=12 HEAD
}

build() {
	cd "${srcdir}/${_pkgname}"

	arch-meson build/
	meson compile -C build/
}

package() {
	cd "${srcdir}/${_pkgname}"

	if [ -f LICENSE ]; then
		install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	fi

	DESTDIR="$pkgdir/" ninja -C build install
}
