# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: Johannes Dewender arch at JonnyJD dot net

pkgname=obs-build-git
_pkgname=obs-build
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=20130119
pkgrel=2
pkgdesc="Building part of the OpenSUSE Build Service, osc-build - git version"
url="http://build.opensuse.org"
license=("GPL")
depends=(bash perl rpm-org xz)
makedepends=(git)
arch=(any)
source=()
md5sums=()

_gitroot="https://github.com/openSUSE/obs-build.git"
_gitname="$_pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Install..."
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
