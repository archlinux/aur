# Maintainer: Daniel Maslowski <info@orangecms.org>

_gopkgname=minio
pkgname=$_gopkgname-git
pkgver=r3058.01cbacd
pkgrel=1
pkgdesc='Object storage server compatible with Amazon S3'
arch=('x86_64' 'i686')
url='https://minio.io'
license=('APACHE')
makedepends=('go')
depends=('glibc')
options=('!strip')
source=('git://github.com/minio/minio.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gopkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/github.com/minio/minio"
  go build
}

package() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/github.com/minio/minio"
  install -Dm755 "$_gopkgname" "$pkgdir/usr/bin/$_gopkgname"
}
# vim:set ts=2 sw=2 et:
