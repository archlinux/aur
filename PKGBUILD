# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=aesop-git
_gitname=aesop
pkgver=r17.295305d
pkgrel=1
pkgdesc="The simplest PDF viewer around designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/lainsce/aesop"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'libsoup' 'json-glib')
optdepends=('lib32-json-glib')
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname")
conflicts=("$_gitname")
source=("git+https://github.com/lainsce/aesop.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${srcdir}/${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

