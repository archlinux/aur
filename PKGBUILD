# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=pantheon-agent-geoclue2
_author=elementary
pkgname=("${_gitname}")
pkgver=1.0.4
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
sha256sums=("079b0886039ec25ee4076b25776d024209e67e3c80eb1be67cd8d3e9b6a5602d")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

