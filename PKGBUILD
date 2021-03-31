# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20190619
pkgrel=4
pkgdesc='Version Control System for $HOME that manages multiple Git repositories'
arch=('any')
url="https://github.com/RichiH/$pkgname"
license=('GPL')
depends=('git')
makedepends=('ruby-ronn')
checkdepends=('perl' 'perl-shell-command' 'perl-test-most')
optdepends=('myrepos: helps manage a large number of repositories')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RichiH/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9f9373bd96dfa1317ff119b2a3feaffc0e5331816e940267daf088637f995f5f')

build() {
    cd "$pkgname-$pkgver"
    make manpages
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' all='manpages' install
}
