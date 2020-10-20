# Maintainer: edward-p <edward AT edward-p DOT xyz>

pkgname=devicon-lookup-git
_pkgname=devicon-lookup
pkgver=0.8.0.r397.g9dbd84b
pkgrel=1
pkgdesc='A simple standalone CLI tool. It accepts text over stdin, and returns it stdout with a devicon prepended.'
arch=('x86_64')
url='https://github.com/coreyja/devicon-lookup'
license=('MIT')
depends=('awesome-terminal-fonts')
makedepends=('rust' 'git')
source=("$_pkgname::git+https://github.com/coreyja/devicon-lookup.git")
sha512sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked --target-dir=./target

}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 ./target/release/devicon-lookup "${pkgdir}/usr/bin/devicon-lookup"
  install -Dm 644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
