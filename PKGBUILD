# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=rubber-bzr
pkgver=450
pkgrel=1
pkgdesc="A wrapper for LaTeX and friends, latest bzr version."
arch=('any')
url="https://launchpad.net/rubber"
license=('GPL')
depends=('python2' 'texlive-core')
install=rubber.install
makedepends=('bzr' 'texinfo')
provides=('rubber')
conflicts=('rubber')
replaces=('rubber-darcs')
source=('rubber::bzr+http://bazaar.launchpad.net/~rubber-devs/rubber/main/'
        'install.patch')
sha512sums=('SKIP'
            '6f7d257e548bbf0e1e176f11a0db4e36fb2f94a42082865d193394b17d700e8ad966370f75a1a49d4c05c8eb5be620094a10cb29eefc1bbc4981cca5faa2ed14')

pkgver() {
  cd rubber
  bzr revno
}

prepare() {
  cd rubber
  patch -p1 < ../install.patch
}

build() {
  cd rubber

  ./configure --prefix=/usr
  make
}

package() {
  cd rubber
  make DESTDIR="$pkgdir"/ install
  cd "$pkgdir"/usr
  mv info man share/
  rm share/rubber/modules/etex.rub # fixes http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=592865
}

