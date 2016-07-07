# Maintainer: David Z. Kil <dave at thekilempire dot com>

pkgname=packer-io-git
pkgver=0.10.1.r168.g6eedd4d
pkgver() {
  cd "$srcdir/packer"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
conflicts=('packer-io')
makedepends=('mercurial' 'go' 'bzr')
source=('packer::git+http://github.com/mitchellh/packer')
md5sums=('SKIP')

prepare() {
  export GOPATH=$srcdir
  go get -u github.com/mitchellh/packer
}

build() {
  export GOPATH=$srcdir
  cd "$srcdir/src/github.com/mitchellh/packer"
  PATH="$PATH:$srcdir/bin" make
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/bin/packer" "$pkgdir/usr/bin/packer-io"
}
