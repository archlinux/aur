# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=rubber-bzr
pkgver=672
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
            '5ad028b6599ff55d6125f0733934e169216f7aea49a941ca541d899e1fb33b9b5a5135f944666b97d8067f2435dd2f1ad4edb304d4c9688711cb0370517623ba')

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
}

