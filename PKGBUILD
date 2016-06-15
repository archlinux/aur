# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-editorconfig-git
_gitproj="editorconfig"
_gitrepo="editorconfig-emacs"
pkgver=0.7.6
pkgrel=1
pkgdesc="EditorConfig Emacs Plugin"
arch=('any')
url="http://github.com/${_gitproj}/${_gitrepo}"
license=('GPL3')
depends=('emacs' 'git' 'editorconfig-core-c')
provides=('emacs-editorconfig')
install="${pkgname}.install"
source=("git+https://github.com/${_gitproj}/${_gitrepo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  # Latest annotated tag (release)
  git describe --abbrev=0 --tags | sed 's/^v//'
}

build() {
  cd "$_gitrepo"
  make LOAD_PATH="-L /usr/share/emacs/site-lisp -L /usr/share/emacs/site-lisp/dash -L ${srcdir}" \
       all
}

package() {
  cd "$_gitrepo"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/editorconfig-emacs
  cp *.el* ${pkgdir}/usr/share/emacs/site-lisp/editorconfig-emacs
}
