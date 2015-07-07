# Maintainer: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

_pkgname=vcsh
pkgname=vcsh-git
pkgver=1.20141026.r38.gd5c11e4
pkgrel=1
epoch=1
pkgdesc='manage config files in HOME via fake bare git repositories'
arch=('any')
url='https://github.com/RichiH/vcsh'
license=('GPL')
depends=('git')
makedepends=('git' 'ruby-ronn') # perl-shell-command perl-test-most
optdepends=('myrepos: helps manage a large number of repositories')
provides=("vcsh")
conflicts=("vcsh")
source=("git://github.com/RichiH/vcsh.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's|\(install:\) all|\1|' Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  
  make manpages
}

check() {
  cd "$srcdir/$_pkgname"
  
  # Tests aren't done currently because of the number of flagged aur packages
  #make -k test
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}

# vim:set ts=2 sw=2 et:
