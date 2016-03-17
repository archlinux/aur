# Maintainer: aksr <aksr at t-com dot me>
pkgname=xaric-git
pkgver=0.13.7.r1.g9803117
pkgrel=1
epoch=
pkgdesc="An IRC client similar to ircII, BotchX, or ircII EPIC."
arch=('i686' 'x86_64')
url="http://xaric.org/"
url="https://github.com/laeos/xaric"
license=('GPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('xaric')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/laeos/xaric.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --exec_prefix=/usr            \
              --prefix=/usr                 \
              --datarootdir=/usr/share/doc  \
              --mandir=/usr/share/man
  make LIBS="-lncursesw -lpthread"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

