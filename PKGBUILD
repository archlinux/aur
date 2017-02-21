# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=plastex-git
pkgver=1.0.0.107.gdbb3b25
pkgrel=1
pkgdesc="Python-based LaTeX document processing framework"
arch=('any')
url="http://tiarno.github.io/plastex/"
license=('custom')
depends=('python2' 'texlive-core')
makedepends=('git')
provides=('plastex')
conflicts=('plastex')
source=("git+https://github.com/tiarno/plastex.git")
md5sums=('SKIP')
_gitname="plastex"

pkgver() {
 cd "$srcdir/$_gitname"
 git describe --tags | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  find  . -name "*.py" -exec sed -i '1s+python+python2+' {} \;
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=$pkgdir/ 
  install -Dm644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE 
  for _i in  licenses/*
  do 
    install -Dm644 ${_i} $pkgdir/usr/share/licenses/$pkgname/${_i}
  done
}
