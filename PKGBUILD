pkgname=aurutils
pkgver=0.2.1
pkgrel=1
pkgdesc='helper tools for the aur'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("https://github.com/AladW/aurutils/archive/$pkgver.tar.gz")
md5sums=('e7530dcf300b13a2a34754e43ce0395d')
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

