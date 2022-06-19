# Contributor: Michael Orishich <mishaor2005@ukr.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ls_extended-git
pkgver=2.0.0.r159
pkgrel=3
pkgdesc='ls with coloring and icons - from git'
arch=('x86_64')
url="https://github.com/Electrux/ls_extended"
license=('custom:BSD')
makedepends=('git')
depends=('glibc')
conflicts=('ls_extended')
provides=('ls_extended')
optdepends=('nerd-fonts-symbols: for icon support')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf %s.r%s $(grep VERSION CMakeLists.txt| grep -v \( | cut -d " " -f2) \
	 $(git rev-list --count HEAD)
}

build() {
  cd "${pkgname%-git}"
  ./build.sh
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -D bin/ls_extended "$pkgdir"/usr/bin/${pkgname%-git}
}
