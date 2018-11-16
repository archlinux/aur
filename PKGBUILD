# Maintainer: David Z. Kil <dave at thekilempire dot com>

pkgname=packer-io-git
pkgver=1.3.2.r190.gc0d5899c3
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
makedepends=('go')
source=('packer::git+http://github.com/hashicorp/packer')
md5sums=('SKIP')
GOPATH=$srcdir

prepare() {
  mkdir -p "$(go env GOPATH)/src/github.com/hashicorp" && cd $_
  ln -s $srcdir/packer .
}

build() {
  cd "$(go env GOPATH)/src/github.com/hashicorp/packer"
  make dev
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$(go env GOPATH)/src/github.com/hashicorp/packer/bin/packer" "$pkgdir/usr/bin/packer-io"
}
