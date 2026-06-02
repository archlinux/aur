# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: sballert <sballert@posteo.de>

_gituser="jwiegley"
_gitrepo="emacs-async"

pkgname=emacs-async-git
_pkgname=async
pkgver=v1.9.9.r31.g5faab28
pkgrel=1
pkgdesc="Asynchronous processing in Emacs"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=("emacs-async=${pkgver#v}")
conflicts=('emacs-async')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_gitrepo"
  make
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir/usr/share/emacs/site-lisp/${_pkgname}/"
  make install DESTDIR="${pkgdir}/usr/share/emacs/site-lisp/${_pkgname}"
}
