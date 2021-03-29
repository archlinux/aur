# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh-git
pkgver=1.20190619.r0.gdbc9c07
pkgrel=1
epoch=1
pkgdesc='Version Control System for $HOME that manages multiple Git repositories'
arch=('any')
url="https://github.com/RichiH/${pkgname%-git}"
license=('GPL')
depends=('git')
makedepends=('ruby-ronn')
checkdepends=('perl' 'perl-shell-command')
optdepends=('myrepos: helps manage a large number of repositories')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git://github.com/RichiH/vcsh.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i 's#^\(install:\) all#\1 manpages#' Makefile
}

build() {
  cd "$pkgname"
  make manpages
}

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}
