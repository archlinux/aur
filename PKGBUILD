# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-completion
pkgver=1.3.1
pkgrel=1
pkgdesc='Git completions for Zsh and Bash'
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('GPLv2')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
  cd $pkgname &&
  make test
}

package() {
  cd $pkgname &&
  # TODO find a better location than /usr/local/share
  DESTDIR="$pkgdir" make \
	  zshfuncdir=/usr/share/zsh/site-functions \
	  completionsdir=/usr/local/share/bash-completion/completions \
	  sharedir=/usr/share/git-completion \
	  install
}
