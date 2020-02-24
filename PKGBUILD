# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh-git
_pkgname=${pkgname%-git}
pkgver=1.20151229.r36.gcb33546
pkgrel=1
epoch=1
pkgdesc='manage config files in HOME via fake bare git repositories'
arch=('any')
url="https://github.com/RichiH/$_pkgname"
license=('GPL')
depends=('git')
makedepends=('git' 'perl-shell-command' 'perl-test-most' 'ruby-ronn')
optdepends=('myrepos: helps manage a large number of repositories')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git://github.com/RichiH/vcsh.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git tag v1.20151229-arch 5f70699 ||:
  git describe --tags --long | sed 's/-arch//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i 's|\(install:\) all|\1|' Makefile
}

build() {
  cd "$pkgname"
  make manpages
}

check() {
  cd "$pkgname"
  make -k test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}

# vim:set ts=2 sw=2 et:
