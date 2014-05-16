pkgname=python2-flowui-git
pkgver=0.2.1.d14b2af
_pkgver=0.2.1
pkgrel=1
pkgdesc="A flow-based data presentation framework for terminals. Git version."
url="http://github.com/dholm/FlowUI/"
depends=('python2')
makedepends=('python2' 'git')
license=('BSD')
arch=('any')
source=("FlowUI::git+https://github.com/dholm/FlowUI.git")
md5sums=('SKIP')

provides=(python2-flowui)
conflicts=(python2-flowui)

pkgver() {
  cd $srcdir/FlowUI
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  printf "%s.%s" "$_pkgver" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/FlowUI
  python2 setup.py build
}

package() {
  cd $srcdir/FlowUI
  python2 setup.py install --root="$pkgdir" --optimize=1
}
