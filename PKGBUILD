# Maintainer: Jason Nader <jason.nader protonmail.com>

pkgname=drm_monitor-git
_pkgname=drm_monitor
pkgver=r1.9865e3e
pkgrel=1
license=('MIT')
pkgdesc='A CLI tool to monitor DRM/KMS state.'
makedepends=("meson" "git")
depends=(
	"libdrm"
)
arch=("x86_64")
url='https://github.com/emersion/drm_monitor'
source=("${pkgname%-*}::git+https://github.com/emersion/drm_monitor.git")
sha1sums=('SKIP')
provides=('drm_monitor')
conflicts=('drm_monitor')

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
