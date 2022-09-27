#PKGBUILD was last modified on September 27, 2022 at 03:49 PM EDT by bms#
# Maintainer: Ben Sutter <benjaminsutter@outlook.com>
pkgname=guile-colorized-git
pkgver=v0.1.r5.g1625a79
pkgrel=1
pkgdesc="Colorized Guile REPL from Git"
arch=('any')
url="https://gitlab.com/NalaGinrut/guile-colorized"
license=('GPL')
makedepends=('git' 'sed' 'guile')
provides=("guile-colorized=$pkgver")
source=("${pkgname%-git}::git+https://gitlab.com/NalaGinrut/guile-colorized.git")
md5sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"
  sed -i -e "s%^TARGET.\+:= %TARGET := $pkgdir%" -e 's%install:%install:\n	mkdir -p \$\(TARGET\)\n%' Makefile
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's%\([^-]*-g\)%r\1%;s%-%.%g'
}

package() {
  cd "${pkgname%-git}"
  make install
}
#end
