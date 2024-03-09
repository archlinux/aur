# Contributor: cleanrock (AT gmail DOT com)
# Contributor: Erdbeerkaese (erdbeerkaese AT gawab DOT com)
# Contributor: DuGi <dugi@irc.pl>

pkgname=springlobby-git
pkgver=0.274.4.g290f1fa73
pkgrel=1
pkgdesc="A free cross-platform lobby client for the Spring RTS project, development version."
arch=('i686' 'x86_64')
url="https://github.com/springlobby/springlobby/wiki"
license=('GPL2')
depends=('wxwidgets-gtk3' 'boost-libs' 'libnotify' 'curl' 'hicolor-icon-theme' 'alure')
optdepends=() 
makedepends=('git' 'cmake' 'boost')
conflicts=('springlobby')
provides=('springlobby')
install=springlobby.install
source=('git+https://github.com/springlobby/springlobby.git')
noextract=()
md5sums=('SKIP')
# options=('!strip' 'debug' '!buildflags')

_gitname="springlobby"

pkgver() {
  cd "$srcdir/$_gitname"
  # package version is Tag.CommitsSinceTag.CommitId, e.g 0.171.205.g86a3481
  git describe --long | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim: sw=2:ts=2 et:
