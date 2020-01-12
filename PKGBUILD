# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor:

_gitname=planner
_author=alainm23
pkgname=("artegeek-${_gitname}-git")
pkgver=r276.d16c537
pkgrel=1
pkgdesc="Task and project manager, designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('evolution-data-server' 'glib2' 'granite' 'gtk3' 'json-glib' 'libical2'
	 'libgee' 'libsoup' 'sqlite' 'webkit2gtk')
optdepends=('')
makedepends=('git' 'meson' 'vala')
provides=("artegeek-${_gitname}" "planner-eos")
conflicts=("artegeek-${_gitname}" "planner-eos")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

