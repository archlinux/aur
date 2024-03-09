# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=plasma-containmentactions-customdesktopmenu
_gitcommit=896bfa4f76620cc377088e454281a12dfa3f5a74

pkgname=plasma-addons-customdesktopmenu-git
pkgver=0.2.0.r5.896bfa4
pkgrel=1
pkgdesc='Custom desktop menu for Plasma6'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
#depends=('plasma-desktop' 'kdeplasma-addons')
depends=('kdeplasma-addons')
makedepends=('git' 'extra-cmake-modules')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"/src
	cmake --fresh -B ../_build .
	cd ../_build
	make clean
	make
}

package() {
	cd "${_githubrepo}"
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/plasma-addons-customdesktopmenu-git/LICENSE
	install -D -m755 _build/bin/plasma/containmentactions/matmoul-customdesktopmenu.so ${pkgdir}/usr/lib/qt6/plugins/plasma/containmentactions/matmoul-customdesktopmenu.so
}
