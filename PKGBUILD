# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
pkgname=regainer-git
_pkgname="${pkgname%-git}"
pkgver=r35.da64115
pkgrel=1
pkgdesc='Advanced ReplayGain scanner and tagger'
arch=('any')
url="https://github.com/kepstin/${_pkgname}"
license=('MIT')
depends=('python' 'python-mutagen' 'ffmpeg')
makedepends=('git' 'flit')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	export PIP_ROOT="${pkgdir}"
	export PIP_OPTIMIZE=1
	export PIP_NO_DEPS=1
	export PIP_IGNORE_INSTALLED=1
	export FLIT_ROOT_INSTALL=1
	python3 -m flit install --env
	install -Dm644 -t "$PIP_ROOT/usr/share/licenses/$_pkgname" COPYING
}
