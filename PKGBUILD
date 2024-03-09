# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=plasma-containmentactions-customdesktopmenu
_pkgtagname=v0.2.0

pkgname=plasma-addons-customdesktopmenu
pkgver=0.2.0
pkgrel=1
pkgdesc='Custom desktop menu for Plasma6'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
depends=('kdeplasma-addons')
makedepends=('git' 'extra-cmake-modules')
install=${pkgname}.install
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('684cf81599b4e5efa9ddc39f0de89fe9a135f7c50c10e6585d2c6a3a9b9fcebc')

build() {
	cd "${_githubrepo}-${pkgver}"/src
        cmake --fresh -B ../_build .
        cd ../_build
        make clean
        make
}

package() {
	cd "${_githubrepo}-${pkgver}"
        install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/plasma-addons-customdesktopmenu-git/LICENSE
        install -D -m755 _build/bin/plasma/containmentactions/matmoul-customdesktopmenu.so ${pkgdir}/usr/lib/qt6/plugins/plasma/containmentactions/matmoul-customdesktopmenu.so
}
