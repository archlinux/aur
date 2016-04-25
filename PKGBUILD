pkgname=aurutils-git
pkgver=0.8.2.r11.g60acbd1
pkgrel=1
pkgdesc='helper tools for the aur'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("git+$url")
md5sums=('SKIP')
conflicts=('aurutils')
provides=('aurutils')
depends=('pacman>=5.0' 'expac' 'jshon' 'git' 'aria2'
         'pacutils-git' 'repose-git' 'datamash-git')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: build in an nspawn container'
	    'vifm: improved build file interaction')

pkgver() {
  cd aurutils
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

check() {
  cd aurutils
  LANG=C shellcheck -e 2016 -x bin/*
}

package() {
  cd aurutils
  install -d "$pkgdir"/usr/{bin,share{/zsh/site-functions,/man/man1,{/licenses,/doc}/aurutils}}

  install -m755 bin/*          "$pkgdir"/usr/bin/
  install -m644 completions/*  "$pkgdir"/usr/share/zsh/site-functions/
  install -m644 doc/*          "$pkgdir"/usr/share/man/man1/
  install -m644 LICENSE        "$pkgdir"/usr/share/licenses/aurutils/
  install -m644 CREDITS README "$pkgdir"/usr/share/doc/aurutils/
}
