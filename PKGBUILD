# $Id$
# Maintainer: Chris Fordham aka flaccid

pkgname=containerd-git
_pkgname=containerd
pkgver=v0.2.3.r383.g42a17f9
pkgrel=1
pkgdesc='A daemon to control runC, built for performance and density'
url='https://containerd.tools/'
conflicts=('containerd')
depends=('glibc' 'runc-git')
makedepends=('go' 'git')
replaces=('containerd')
arch=('i686' 'x86_64')
source=("git+https://github.com/docker/containerd.git")
license=("APACHE")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  pushd "$GOPATH/src/github.com/docker/containerd"
    make setup
    make
  popd
}

package() {
  pushd "$GOPATH/src/github.com/docker/containerd/bin"
    for f in $(find . -type f -print); do
      install -Dm755 "$f" "$pkgdir/usr/bin/$f"
    done
  popd
}

# vim:set ts=2 sw=2 et:
