pkgname=aurutils
pkgver=0.8.2
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("https://github.com/AladW/aurutils/archive/$pkgver.tar.gz")
md5sums=('afad569cbb547aa9e0a5336e1129bcb1')
depends=('pacman>=5.0' 'git' 'repose' 'jshon' 'pacutils' 'expac' 'aria2' 'datamash')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: aurbuild -c'
	    'vifm: improved build file interaction')

check() {
  cd "$pkgname-$pkgver"
  LANG=C shellcheck -e 2016 -x bin/*
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{bin,share{/man/man1,{/licenses,/doc}/aurutils}}

  install -m755 bin/* "$pkgdir"/usr/bin/
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/aurutils/
  install -m644 CREDITS README "$pkgdir"/usr/share/doc/aurutils/
  install -m644 doc/* "$pkgdir"/usr/share/man/man1/
}

