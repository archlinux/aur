# Maintainer: Paarth Mahadik <paarth.mahadik@gmail.com>
# Contributor: Yujonpradhananga <yujonpradhan123@gmail.com>
pkgname=pdf-cli
pkgver=2.0
pkgrel=1
pkgdesc="A terminal-based PDF, EPUB and DOCX viewer with fuzzy search and high-res image rendering"
arch=('x86_64' 'aarch64')
url="https://github.com/Yujonpradhananga/pdf-cli"
license=('MIT')
depends=('mupdf' 'libffi')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v.$pkgver.tar.gz")
sha256sums=('325a6b46356311442f2843d2ab50410ea6a3ee9ad4a8ec6954f8158f90ecf89d')

build() {
  cd "$pkgname-v.$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-v.$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
