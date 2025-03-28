# Maintainer: TheCyberArcher <cyberarcher@protonmail.ch>
# Contributor : sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Army
_pkgname=vim-latexsuite
pkgname=$_pkgname-git
pkgver=1.10.0.r1021.08821de
pkgrel=1
epoch=1
pkgdesc="Provides a comprehensive set of tools to view, edit, and compile LaTeX documents within Vim. Also provides macros to speed up the creation of LaTeX documents."
arch=('any')
url="http://vim-latex.sourceforge.net"
license=('vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'perl')
makedepends=('git')
optdepends=('python' 'texlive-bin')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+https://github.com/vim-latex/vim-latex.git" "LICENSE")
sha256sums=('SKIP' '0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720')

pkgver() {
    cd "${_pkgname}"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  find . -type f -name *.py | xargs sed -i 's/\/usr\/bin\/python/\/usr\/bin\/env python3/g'
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="$pkgdir/usr" VIMDIR="$pkgdir/usr/share/vim/vimfiles" install
  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
