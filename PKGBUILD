# Maintainer: pandada8 <pandada8@gmail.com>
pkgname=img-git
pkgver=v0.5.6.r9.g013bb211
pkgrel=1
pkgdesc="Standalone, daemon-less, unprivileged Dockerfile and OCI compatible container image builder"
arch=('x86_64')
url="https://github.com/genuinetools/img"
license=('MIT')
depends=('runc')
makedepends=('go')
conflicts=("img" "img-bin")
license=("MIT")
source=(
  "git+https://github.com/genuinetools/img.git"
)
md5sums=(
  'SKIP'
)
pkgver () {
  cd img
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd img
  echo $GOPROXY
  make BUILDTAGS="seccomp noembed"
}

package() {
  install -D "${srcdir}/img/img" "${pkgdir}/usr/bin/img"
}

# vim:set ts=2 sw=2 et:
