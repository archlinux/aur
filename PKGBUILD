# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=pantheon-agent-geoclue2
_author=elementary
pkgname=("${_gitname}")
pkgver=1.0.2
pkgrel=1
pkgdesc="Geoclue2 Agent for Pantheon. The location services agent appears whenever an application wants to request permission to use location services."
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('dbus-glib' 'glib2' 'glibc' 'gtk3' 'geoclue2')
makedepends=('git' 'meson' 'vala')
optdepends=()
provides=("${_gitname}" "pantheon-geoclue2-agent")
conflicts=("${_gitname}-git" "pantheon-geoclue2-agent" "pantheon-geoclue2-agent-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=("7569d61131f667666bdee6633b7f730b")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

