# Maintainer: Javier Tia <floss@jetm.me>
_pkgname=git-add--interactive
__pkgname=gai
pkgname=git-add-interactive
pkgver=0.5.0
pkgrel=1
pkgdesc="git-add--interactive with extra features"
arch=('x86_64')
url="https://github.com/cwarden/git-add--interactive"
options=(!lto)
license=('MIT')
depends=('git')
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2699f1d65a01fcd45aaf303b1c8fca084fef1b2e311b9aed345e183ec4349448')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ${__pkgname} .
}

note() {
	printf "${blue}==>${yellow} NOTE:${bold} $1${all_off}\n"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 ${__pkgname} "$pkgdir"/usr/bin/${__pkgname}

  note "Original command is written as gai. It can be called as:"
  note "gai <...>"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
