# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=jand-git
pkgdesc="The Jan process manager"

pkgver() {
  cd "JanD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r17.b44ca47
pkgrel=1
pkgbase=jand-git
replaces=()
arch=('x86_64')
url="https://github.com/Jan0660/JanD"
license=('MIT')
groups=()
makedepends=('git')
depends=('dotnet-sdk-bin' 'clang' 'llvm')
source=('git+https://github.com/Jan0660/JanD.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/JanD"
  dotnet publish -r linux-x64 -c release
  mv JanD/bin/Release/net5.0/linux-x64/publish/JanD JanD/bin/Release/net5.0/linux-x64/publish/jand
  install -Dm 755 JanD/bin/Release/net5.0/linux-x64/publish/jand -t "${pkgdir}/usr/bin/"
}

