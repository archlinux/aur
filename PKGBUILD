# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Anton Semjonov < a**** \ät semjonov.de >

_pkgname="slirp4netns"
pkgname="${_pkgname}-git"
pkgver=v1.1.12.r2.g631f361
pkgrel=1
pkgdesc="User-mode networking for unprivileged network namespaces."
arch=('any')
depends=(libseccomp libslirp libcap)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/rootless-containers/$_pkgname.git"
license=(GPL2)
options=('emptydirs')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname || exit 1
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname || exit 1
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
