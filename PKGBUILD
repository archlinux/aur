# Contributor: Paige Aran <paige.aran@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-git
pkgver=7.0.0.12.38897.369eb65ec2
pkgrel=1
pkgdesc="Minimal Racket installation, without DrRacket, from git"
arch=('i686' 'x86_64')
url="http://racket-lang.org/"
license=('LGPL')
depends=('bash' 'libffi')
makedepends=('git')
provides=('racket')
conflicts=('racket')
options=('!strip' '!emptydirs')
source=("git://github.com/racket/racket.git")
_gitname="racket"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf %s.%s.%s \
	 $(grep ' MZSCHEME_VERSION ' \
		${srcdir}/${_gitname}/${_gitname}/src/racket/src/schvers.h \
		| cut -d '"' -f 2) "$(git rev-list --count HEAD)" $(git log -1 --format='%h')
}

build() {
  cd $_gitname

  make in-place
}

package() {
  cd $_gitname/$_gitname
  install -d "$pkgdir"/usr/share/doc/racket
  install -d "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/share/racket/
  cp -r bin "$pkgdir"/usr
  cp -r collects "$pkgdir"/usr/share/racket/
  cp -r lib "$pkgdir"/usr/lib/racket
  cp -r doc/* "$pkgdir"/usr/share/doc/racket
  install -Dm644 etc/config.rktd "$pkgdir"/etc/config.rktd
  cp -r man "$pkgdir"/usr/share
  cp -r share/applications "$pkgdir"/usr/share
}
