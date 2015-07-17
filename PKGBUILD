# Contributor: Ben Morgan <neembi@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=repoctl-git
pkgver=v0.12
pkgrel=1
pkgdesc="A supplement to repo-add and repo-remove which simplifies managing local repositories"
arch=('i686' 'x86_64')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go')
replaces=('repo-keep')
source=("git+https://github.com/cassava/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's/-/./g'
}

build() {
  cd ${pkgname%-git}
  go build
}

package() {
  cd ${pkgname%-git}
  # repo program
  mkdir -p $pkgdir/usr/bin
  install -m755 repoctl $pkgdir/usr/bin/
  # Install other documentation
  install -m644 TODO README.md NEWS $pkgdir/usr/share/doc/repo-keep/
  # Install completion files
  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  install -m644 contrib/zsh_completion $pkgdir/usr/share/zsh/site-functions/_repoctl
}
