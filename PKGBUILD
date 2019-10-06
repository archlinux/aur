# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

pkgname=jrnl-git
_gitname=jrnl
pkgver=0.r775.350f0a1
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="https://jrnl.sh/"
license=('MIT')
depends=('python')
makedepends=('git' 'poetry')
conflicts=("jrnl")
source=("git+https://github.com/maebert/jrnl.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf '0.r%s.%s' \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  make install
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	
  mkdir -p $pkgdir/usr/bin/
  touch $pkgdir/usr/bin/jrnl
  echo "$HOME/.cache/pypoetry/virtualenvs/jrnl*/bin/jrnl" > $pkgdir/usr/bin/jrnl
  chmod +x $pkgdir/usr/bin/jrnl
}
