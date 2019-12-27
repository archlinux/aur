# Maintainer: Mendel Greenberg <mendel at chabad360 dot com>

pkgname=run-git
pkgver=r45.14598e7
pkgrel=1
pkgdesc="Easily manage and invoke small scripts and wrappers"
arch=('i686' 'x86_64')
url="https://github.com/TekWizely/run"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("git+https://github.com/TekWizely/run.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/run"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "${srcdir}/run"
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" .
}

package(){
  cd "${srcdir}/run"
  install -Dm755 run "${pkgdir}/usr/bin/run"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

