# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20190619
pkgrel=2
pkgdesc='Version Control System for $HOME that manages multiple Git repositories'
arch=('any')
url="https://github.com/RichiH/$pkgname"
license=('GPL')
depends=('git')
makedepends=('ruby-ronn')
checkdepends=('perl' 'perl-shell-command')
optdepends=('myrepos: helps manage a large number of repositories')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RichiH/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9f9373bd96dfa1317ff119b2a3feaffc0e5331816e940267daf088637f995f5f')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's#^\(install:\) all#\1 manpages#' Makefile
}

build() {
  cd "$pkgname"
  make manpages
}

check() {
    cd "$pkgname-$pkgver"
	make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}
