# Maintainer: SvartaHjarta <qi0cez9jf@mozmail.com>
pkgname=plastex-git
pkgver=3.0.r12.g298a55b6
pkgrel=1
pkgdesc="Python-based LaTeX document processing framework"
arch=('any')
url="https://github.com/$pkgname/$pkgname/"
license=('custom')
depends=('python' 'texlive-core')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=('plastex')
conflicts=('plastex')
source=("git+https://github.com/plastex/plastex.git")
b2sums=('SKIP')
_gitname="plastex"

build() {
  cd "$_gitname"
  python -m build --wheel --no-isolation
}

pkgver() {
 cd ${pkgname%-git}
 git describe --tags | sed 's|-|.r|' |tr - .
}

package() {
  cd "$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  for _i in licenses/*; do
    install -Dm644 ${_i} "$pkgdir"/usr/share/licenses/"$pkgname"/"$_i"
  done
}
