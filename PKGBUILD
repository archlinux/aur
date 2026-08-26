# Maintainer: yms_hi <yms_hi@Outlook.com>
pkgname=cangjie-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='Cangjie compiler (git version, compiler only)'
url="https://cangjie-lang.cn/"
license=('Apache-2.0')
provides=('cangjie-compiler')
conflicts=('cangjie-compiler')
depends=('openssl>=3.0')
makedepends=('python' 'cmake' 'ninja' 'llvm15' 'gcc' 'binutils' 'git')
options=(!lto)
source=("git+https://atomgit.com/Cangjie/cangjie_compiler.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd cangjie_compiler
  printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd cangjie_compiler
  python3 build.py build -t release --no-tests
}

package() {
  cd cangjie_compiler
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/opt/cangjie-git"
  cp -a output/* "${pkgdir}/opt/cangjie-git/"
}
