# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit="951a51bd37e5e3454850d471b05d9d51d4851b74"
pkgname=git-sizer
pkgver=1.3.0
pkgrel=1
pkgdesc='Compute various size metrics for a Git repository, flagging those that might cause problems'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/github/git-sizer'
license=('MIT')
depends=('git')
makedepends=('go')
#source=("https://github.com/github/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://github.com/github/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('22491d77f5a694b9e1ea0596884a99fe5b1e409e9bed6b07cb834b5361311f77')

build() {
  #cd "${pkgname}-${pkgver}"
  cd "${pkgname}-${_commit}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.BuildVersion=${pkgver} -extldflags ${LDFLAGS}"
  go build -o git-sizer -ldflags="${_LDFLAGS}" git-sizer.go
}

package() {
  #cd "${pkgname}-${pkgver}"
  cd "${pkgname}-${_commit}"
  # binary
  install -D -m755 git-sizer "${pkgdir}/usr/bin/git-sizer"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
