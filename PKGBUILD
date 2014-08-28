# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>

pkgname=git-bzr-kfish-git
pkgver=20120319
pkgrel=1
pkgdesc="a bidirectional git - bazaar gateway"
arch=('any')
url="https://github.com/kfish/git-bzr"
license=('GPL')
depends=('git' 'bzr' 'bzr-fastimport')
source=()
md5sums=()

_gitroot='https://github.com/kfish/git-bzr.git'
_gitname='git-bzr'

build() {
  cd "$srcdir"
  msg "Connecting to git server..."
  if [[ -d $_gitname ]]; then
	cd $_gitname && git pull origin
	msg "The local files are up-to-date"
  else
	git clone $_gitroot $_gitname --depth=1
	cd $_gitname
  fi

}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}/usr/bin/"
  install git-bzr "${pkgdir}/usr/bin/"
}
