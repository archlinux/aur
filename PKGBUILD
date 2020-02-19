# Maintainer: Hao Long <aur@esd.cc>

pkgname=esbuild-git
pkgver=r84.e989f9d
pkgrel=1
pkgdesc="An extremely fast JavaScript bundler and minifier"
arch=("x86_64" "i686")
url="https://github.com/evanw/esbuild"
license=(MIT)
makedepends=(go)
provides=(esbuild)
conflicts=(esbuild)
source=("${pkgname}::git+https://github.com/evanw/esbuild.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/src/esbuild/main/"
  GOPATH="${srcdir}/${pkgname}/" GO111MODULE=off go build -o esbuild -trimpath -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 src/esbuild/main/esbuild ${pkgdir}/usr/bin/esbuild
}
