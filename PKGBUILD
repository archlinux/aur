# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=plastex-git
pkgver=1.0.0.117.g7803cc5
pkgrel=2
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
 cd ${pkgname%-git}
 git describe --tags | sed 's|-|.|g'
}

prepare() {
  cd ${pkgname%-git}
  find  . -name "*.py" -exec sed -i '1s+python+python2+' {} \;
}

package() {
  cd ${pkgname%-git}
  python2 setup.py install --root="$pkgdir"/ 
  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE 
  for _i in  licenses/*
  do 
    install -Dm644 ${_i} "$pkgdir"/usr/share/licenses/$pkgname/${_i}
  done
}
