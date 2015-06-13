# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=makemeasandwich-nosudo-git
pkgver=33.4d79aab
pkgrel=1
pkgdesc="Orders from Jimmy John's via command line, inspired by xkcd 149. This package has less snark."
arch=('i686' 'x86_64')
url="https://github.com/travist/makemeasandwich.js"
license=('MIT')
depends=('nodejs' 'phantomjs')
makedepends=('git' 'npm')
provides=('makemeasandwich' 'makemeasandwich-git' 'makemeasandwich-nosudo' 'makemeasandwich-nosudo-git')
conflicts=('makemeasandwich' 'makemeasandwich-git' 'makemeasandwich-nosudo')
source=("$pkgname::git://github.com/travist/makemeasandwich.js"
	'nosudo.patch')
md5sums=('SKIP'
	'57fe79325ea7043de15aa0f08a53d45f')

prepare() {
  patch -p0 < nosudo.patch
}

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$pkgname"
  mkdir "$pkgdir/usr"
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
