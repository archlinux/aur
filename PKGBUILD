# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-editorconfig-git
pkgver=0.7.9
pkgrel=1
pkgdesc="EditorConfig Emacs Plugin"
arch=('any')
_github_org="editorconfig"
_github_repo="editorconfig-emacs"
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs' 'git' 'editorconfig-core-c')
provides=('emacs-editorconfig')
install="${pkgname}.install"
source=("git+https://github.com/${_github_org}/${_github_repo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_github_repo"
  git describe --abbrev=0 --tags | sed 's/^v//'
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
