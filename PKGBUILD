pkgname=tcping-go-git
_pkgname=tcping
pkgver=0.1.1.r6.g7867893
pkgrel=1
pkgdesc='ping over a tcp connection'
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go')
arch=('x86_64')
url="https://github.com/cloverstd/tcping"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/cloverstd/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
  cd "$srcdir/tcping"
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd "$srcdir/tcping"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
