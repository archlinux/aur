# Maintainer: Baptiste Grenier <baptiste@bapt.name>

_pkgname=asanawarrior
pkgname=asanawarrior-git
pkgver=VERSION
pkgrel=1
pkgdesc="The only Asana command line interface you'll ever need."
arch=('x86_64' 'i686')
url='https://github.com/manishrjain/asanawarrior'
provides=('asanawarrior')
conflicts=('asanawarrior')
license=('apache')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("$_pkgname::git+http://github.com/manishrjain/$_pkgname#branch=master")
noextract=()
sha256sums=('SKIP')
_gourl=github.com/manishrjain/asanawarrior

pkgver() {
  cd "$_pkgname"
  # Get the version number.
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
  GOPATH="$srcdir" go build
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
