pkgname=aurutils
pkgver=0.2.0
pkgrel=1
pkgdesc='helper tools for the aur'
arch=('any')
url='https://github.com/AladW/aurutils'
license=('ISC')
source=("$url/archive/$pkgver.tar.gz")
depends=('pacman>=5.0' 'git' 'repose-git' 'jshon' 'pacutils-git' 'expac' 'aria2')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: aurbuild -c'
	    'vifm: improved build file interaction')

check() {
  cd "$pkgname-$pkgver"
  shellcheck -e 2016,2174 -x ./aur* repofind
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{bin,share{/licenses,/doc}/aurutils}

  install -m755 ./aur* repofind "$pkgdir"/usr/bin/
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/aurutils/
  install -m644 CREDITS doc/* "$pkgdir"/usr/share/doc/aurutils/
}

md5sums=('4d551a54a9544c379ac4aa66f2376157')
