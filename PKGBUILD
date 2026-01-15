# Contributor: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=img
_pkgname=img-linux-amd64
pkgver=0.5.11
pkgrel=2
pkgdesc="Standalone, daemon-less, unprivileged Dockerfile and OCI compatible container image builder"
arch=('x86_64')
url="https://github.com/genuinetools/${pkgname}"
license=('MIT')
groups=()
depends=('runc')
makedepends=('go')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
  "https://github.com/genuinetools/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
md5sums=(
  '80cc8ee2c21aebec3c2957708298577e'
)

build() {
  cd img-${pkgver}
  export GOFLAGS=-mod=vendor
  make BUILDTAGS="seccomp noembed"
}

package() {
  install -D "${srcdir}/img-${pkgver}/img" "${pkgdir}/usr/bin/img"
  install -D -m644 "${srcdir}/img-${pkgver}/LICENSE" \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
