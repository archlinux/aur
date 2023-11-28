# Maintainer: steve finkel <mrsteve0924 at verizon dot net>

pkgname=wstroke-git
pkgver=20231004.e7a0041
pkgrel=1
pkgdesc="a mouse gesture plug-in for wayfire. port of easystroke"
arch=('x86_64')
url="https://github.com/dkondor/wstroke"
license=('ISC')
depends=('wayfire-git' 'nlohmann-json' 'glib2' 'gtk3' 'gtkmm3' 'boost-libs')
makedepends=('git' 'meson' 'ninja')
optdepends=('wcm-git' 'libinput>=1.70')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
source=('git+https://github.com/dkondor/wstroke')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

  printf "%s.%s" "$(git show -s --format=%cs | tr -d -)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson build --prefix=/usr
	ninja -C build
}


package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" ninja -C build install
}
