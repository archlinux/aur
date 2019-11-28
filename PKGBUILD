# Contributor: Michael Orishich <mishaor2005@ukr.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ls_extended-git
pkgver=1.1.0.r27.gd87c350
pkgrel=1
pkgdesc='ls with coloring and icons from git'
arch=('x86_64')
url="https://github.com/Electrux/ls_extended"
license=('custom:BSD')
makedepends=('git')
optdepends=('nerd-fonts-complete: for icon support')
depends=('glibc' 'ttf-nerd-fonts-symbols')
conflicts=('ls_extended')
provides=('ls_extended')
source=("git+$url")
md5sums=('SKIP')
#commit=40f1c4b08e6ad8b52011799e5432862957986aa9#commit=40f1c4b08e6ad8b52011799e5432862957986aa9
pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+.r+'| tr - . | cut -c2-
}

build() {
  cd "${pkgname%-git}"
  # ccp4m project build
  ./build.sh
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/license.txt
  install -D bin/ls_extended "$pkgdir"/usr/bin/${pkgname%-git}
}
