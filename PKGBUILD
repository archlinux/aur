pkgname=aurutils-git
pkgver=0.6.1.r41.g2722c2f
pkgrel=1
pkgdesc='helper tools for the aur'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("git+$url")
md5sums=('SKIP')
depends=('pacman>=5.0' 'expac' 'pacutils-git' 'repose-git' 'jshon' 'git' 'aria2' 'datamash')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: aurbuild -c'
	    'vifm: improved build file interaction')

pkgver() {
  cd aurutils
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd aurutils/bin
  shellcheck -e 2016,2174 -x ./*
}

package() {
  cd aurutils
  install -d "$pkgdir"/usr/{bin,share{/man/man1,{/licenses,/doc}/aurutils}}

  install -m755 bin/* "$pkgdir"/usr/bin/
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/aurutils/
  install -m644 CREDITS README "$pkgdir"/usr/share/doc/aurutils/
  install -m644 doc/* "$pkgdir"/usr/share/man/man1/
}

