# Maintainer: ml <ml@visu.li>
pkgname=kpt
pkgver=0.17.0
pkgrel=1
pkgdesc='Toolkit to manage, manipulate, customize, and apply Kubernetes Resource configurations'
arch=('x86_64')
url='https://googlecontainertools.github.io/kpt/'
license=('Apache')
depends=('git')
makedepends=('go')
install=kpt.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/kpt/archive/v${pkgver}.tar.gz")
sha256sums=('460f54e3d0cff3ae5edf9f1bf5268d219c44c7c01d0ddf9e1d6f33f0ab01ddb8')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o "$pkgname"
}

check() {
  cd "${pkgname}-${pkgver}"
  # tests rely on git identity being present. fails in clean chroot env
  #go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
