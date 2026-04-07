pkgname=gartenrose-git
_pkgname=rose
pkgver=7
pkgrel=1
makedepends=('git' 'nasm')
arch=('x86_64')
options=('!debug')
pkgdesc="Assembler fetch for sysinfo"
url="https://codeberg.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://codeberg.org/MiaMaid/GartenRose")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$_pkgname"
  nasm -f elf64 rose.asm -o rose.o
  ld -s -n -N --gc-sections rose.o -o rose 
}

package() {
   cd "$srcdir/$_pkgname"
   install -Dm755 rose "${pkgdir}/usr/bin/${_pkgname}" 
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
