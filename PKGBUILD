# Contributor: Ian Douglas Scott <ian@iandouglasscott.com>
pkgname=ig2atom-git
pkgver=r20.83347ef
pkgrel=1
pkgdesc="Convert Instagram feed to atom"
arch=('any')
url="https://github.com/ids1024/ig2atom"
license=('MIT')
makedepends=('git')
depends=('python-feedgenerator')
source=('git+https://github.com/ids1024/ig2atom.git')
md5sums=('SKIP')
_gitname="ig2atom"

pkgver () {
  cd $srcdir/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
