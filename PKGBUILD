# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=protocol-git
pkgver=r16.4e8326e
pkgrel=1
pkgdesc="An ASCII Header Generator for Network Protocols"
arch=('any')
url="http://www.luismg.com/protocol/"
license=('GPL3')
depends=('python')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('protocol')
conflicts=('protocol')
source=("git+https://github.com/luismartingarcia/protocol" "fix-setup-py.patch")
md5sums=('SKIP' 'SKIP')
_gitrepo=protocol

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -Np1 -i "$srcdir"/fix-setup-py.patch
}

build() {
  cd "$_gitrepo"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_gitrepo"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 $srcdir/$_gitrepo/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
