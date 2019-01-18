# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

_gitname='sigrok-cli'
pkgname="${_gitname}-git"
pkgver=0.6.0.r58.gb5c8f3a
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, CLI client (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Sigrok-cli"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git')
makedepends=('git')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long --exclude sigrok-cli-unreleased 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/sigrok.cli.//" ||
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
