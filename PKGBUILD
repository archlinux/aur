# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=onboarding
_author=elementary
pkgname=pantheon-${_gitname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Onboarding app for new users in Pantheon Shell"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('gtk3' 'pantheon-agent-geoclue2')
makedepends=('granite' 'meson' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("f76bd6bd2a5fabc18c9a15345cae507f0ee5c2952cbb228a6385372abc44a490")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

