# Maintainer: John Jekins twodopeshaggy@gmail.com

_pkgname=AlienFeed
pkgname=alienfeed-git
pkgver=230d5a6
pkgrel=1
pkgdesc="Reddit command-line client. Follow the latest submissions from your terminal."
url="http://github.com/jawerty/AlienFeed"
arch=('any')
license=('MIT')
depends=('python2-praw-git')
makedepends=('git' 'python2')
source=(git://github.com/jawerty/AlienFeed)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build(){

 cd $_pkgname
 sed -i "s|env python|env python2|" $srcdir/$_pkgname/alienfeed/alien.py
}

package() {
  cd $_pkgname
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -vDm644 alienfeed.bash-completion "$pkgdir/usr/share/bash-completion/completions/alienfeed"
    install -vDm644 alienfeed.1 "$pkgdir/usr/man/man1/alienfeed.1"
}
