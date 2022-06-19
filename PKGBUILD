# Maintainer: Sergey Feschukov <snfesh@yandex.ru>

_pkgname=nautilus-share
pkgname="${_pkgname}-git"
pkgver=r240.58323684
pkgrel=1
pkgdesc='Nautilus extension to share folder using new version Samba'
arch=('x86_64')
url='https://git.gnome.org/browse/nautilus-share'
license=('GPL')
depends=('nautilus' 'samba')
makedepends=('git' 'intltool')
conflicts=('nautilus-share')
source=(
    "git+${url}.git"
    'shares.patch'
)
sha256sums=(
    'SKIP'
    'eae42871a7a1d0a493dadb72f498db9fa530f347e5b801b5d85188be6f3f6794'
)

prepare() {
    patch --directory="${_pkgname}" --strip=0 < shares.patch
}

build() {
    cd ${_pkgname}
    sh ./autogen.sh --prefix=/usr
}

package() {
    make --directory=${_pkgname} PREFIX=/usr DESTDIR="${pkgdir}" install
}
