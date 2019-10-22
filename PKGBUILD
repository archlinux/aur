# Maintainer: Erick Cafferata <erick@cafferata.me>
pkgname=pomod-git
_pkgname=pomod
pkgver=r12.5587fb0
pkgrel=1
license=('MIT')
pkgdesc='The pomodoro daemon'
makedepends=("meson" "scdoc" "git")
depends=(
	"libnotify"
)
arch=(i686 x86_64)
url='https://gitlab.com/erickcc/pomod'
source=("${pkgname%-*}::git+https://gitlab.com/erickcc/pomod.git")
sha1sums=('SKIP')
provides=('pomod')
conflicts=('pomod')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir/" ninja -C build install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
