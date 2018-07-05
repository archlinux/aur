# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=webwatcher-git
_gitname=webwatcher
pkgver=latest
pkgrel=1
pkgdesc="Know when your websites are misbehaving!"
arch=('i686' 'x86_64')
url="https://github.com/kjlaw89/webwatcher"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'glib2' 'sqlite' 'libsoup' 'json-glib' 'libappindicator-gtk3')
optdepends=()
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname")
conflicts=("$_gitname")
source=("git+https://github.com/kjlaw89/webwatcher.git")
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

