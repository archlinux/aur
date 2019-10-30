# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-editorconfig-git
pkgver=0.8.1.r4.59c734af576b
pkgrel=1
pkgdesc="EditorConfig Emacs Plugin"
arch=('any')
_github_org="editorconfig"
_github_repo="editorconfig-emacs"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs' 'editorconfig-core-c-git')
makedepends=('git')
provides=('emacs-editorconfig')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_github_repo"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_github_repo"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L ${srcdir}" \
       all
}

package() {
  cd "$_github_repo"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/editorconfig-emacs
  cp *.el* ${pkgdir}/usr/share/emacs/site-lisp/editorconfig-emacs
}
