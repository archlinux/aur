# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Fabien Devaux <fdev31 @ gmail . com>
_name=chg
pkgname="${_name}"
pkgver="hg"
pkgrel=1
pkgdesc="A bit faster Mercurial client for Unix with per-user cmdserver daemon."
arch=('x86_64' 'x86')
url="https://bitbucket.org/yuja/chg/src"
license=('GPL')
groups=()
depends=('python2' 'mercurial')
makedepends=('mercurial')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_hgroot="https://bitbucket.org/yuja/chg"
_hgrepo="chg"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."
}

package() {
  cd "$srcdir/$_name"
  sed -i "s#/local##" Makefile
  make HGEXTDIR='/usr/lib/python2.7/site-packages' DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
