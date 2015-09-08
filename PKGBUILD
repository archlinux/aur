# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

_gitname='libsigrokdecode'
pkgname="${_gitname}-git"
pkgver=0.2.0.r506.ge4bafb8
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, protocol decoders library (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrokdecode"
license=('GPL3')
depends=('python' 'glib2')
makedepends=('git')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/${_gitname}.//" ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set et sw=2 sts=2 tw=80: