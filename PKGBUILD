# Maintainer: John Luebs

pkgname=vapor-toolbox-git
_pkgname=toolbox
_binname=vapor
pkgver=r1191.3e9a23a
pkgrel=1
pkgdesc="Vapor Toolbox - A cmdline tool for the Vapor web framework"
arch=('x86_64')
url="https://github.com/vapor/toolbox"
license=('MIT')
depends=('swift-language')
makedepends=('git')
conflicts=('vapor-toolbox')
provides=('vapor-toolbox')
source=("git+https://github.com/vapor/toolbox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  swift build -c release
}

package() {
  cd "$_pkgname"

  install -Dm755 .build/release/vapor "$pkgdir/usr/bin/${_binname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
