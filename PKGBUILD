# Maintainer: yannakin <yannakin68+arch@gmail.com>

_gitowner=LucienHH
_gitrepo=obs-doom-transition
pkgname=${_gitrepo}-git
pkgver=1.4.2.e214e79
pkgrel=7
pkgdesc="Plugin for OBS Studio adding a DOOM 93 like transition (screen-melting)"
arch=("x86_64" "aarch64")
url="https://github.com/${_gitowner}/${_gitrepo}"
license=("GPL-2.0-or-later")
depends=("obs-studio" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("${_gitrepo}::git+https://github.com/${_gitowner}/${_gitrepo}")
sha256sums=('SKIP')

pkgver() {
	cd ${_gitrepo}
	printf "%s.%s" "$(git describe --tags)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S ${_gitrepo}
	cmake --build build
}

package() {
	mkdir -p ${pkgdir}/usr/share/obs/obs-plugins/${_gitrepo}
	mkdir -p ${pkgdir}/usr/lib/obs-plugins
	cp -r ${_gitrepo}/data/* ${pkgdir}/usr/share/obs/obs-plugins/${_gitrepo}/
	install -Dm 755 build/${_gitrepo}.so ${pkgdir}/usr/lib/obs-plugins/${_gitrepo}.so
}
