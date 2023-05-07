# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=jand-git
pkgdesc="The Jan process manager"

pkgver() {
  cd "JanD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r144.e5eec4b
pkgrel=1
pkgbase=jand-git
replaces=()
arch=('x86_64')
url="https://github.com/Jan0660/JanD"
license=('MIT')
groups=()
makedepends=('git' 'dotnet-sdk-8.0' 'clang' 'llvm')
depends=()
source=('git+https://github.com/Jan0660/JanD.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/JanD/JanD"
  # sets version suffix to the same as $pkgver
  dotnet publish -r linux-x64 -c release -o ./bin/release/aur-build --version-suffix "aur-$(printf "r%s-%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
  mv ./bin/release/aur-build/JanD ./bin/release/aur-build/jand
  install -Dm 755 ./bin/release/aur-build/jand -t "${pkgdir}/usr/bin/"
}

