# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: fancris3 <fancris3 at aol.com>
_pkgname=places
pkgname=places-git
pkgver=0.20.r215.2115f5a
pkgrel=1
pkgdesc='Enlightenment module: Manage the mounting of volumes'
arch=('i686' 'x86_64')
url='https://phab.enlightenment.org/w/emodules/places/'
license=('MIT')
depends=('enlightenment' 'udisks')
makedepends=('git')
source=('git://git.enlightenment.org/enlightenment/modules/places.git')
sha256sums=('SKIP')

pkgver() {
      cd "${_pkgname}"
      local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)
      printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
      cd "${_pkgname}"
      ./autogen.sh --prefix=/usr --disable-static
      make
}

package() {
      cd "${_pkgname}"
      make DESTDIR="${pkgdir}" install
      install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" ChangeLog NEWS README
      install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" AUTHORS COPYING
}
