pkgname=aurutils
pkgver=0.8.4
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('e1d0033cc330e1901710c7970823a9f2')
depends=('pacman>=5.0' 'git' 'jshon' 'expac' 'aria2>=1.23.0')
	 'repose' 'pacutils' 'datamash'
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: build in an nspawn container'
	    'vifm: improved build file interaction')

check() {
  cd "$pkgname-$pkgver"
  LANG=C shellcheck -e 2016 -x bin/*
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{bin,share{/zsh/site-functions,/man/man1,{/licenses,/doc}/aurutils}}

  install -m755 bin/*          "$pkgdir"/usr/bin/
  install -m644 completions/*  "$pkgdir"/usr/share/zsh/site-functions/
  install -m644 doc/*          "$pkgdir"/usr/share/man/man1/
  install -m644 LICENSE        "$pkgdir"/usr/share/licenses/aurutils/
  install -m644 CREDITS README "$pkgdir"/usr/share/doc/aurutils/
}
