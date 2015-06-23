# Maintainer: sxe <sxxe@gmx.de>

pkgname='quassel-git-monolithic'
_pkgname='quassel'
pkgver=0.12.0.r7.g92490c7
pkgrel=1
pkgdesc="A Qt4 IRC client - Monolithic Version"
url="http://quassel-irc.org"
license='GPL'
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('git')
replaces=('quassel')
conflicts=('quassel-monolithic')
source=('quassel::git://git.quassel-irc.org/quassel.git')
md5sums=('SKIP')

pkgver() {
  #date +%Y%m%d
  cd "$srcdir/$_pkgname"
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^wine.//'
}

build() {
    cd "$srcdir/$_pkgname"

    msg "Starting build process."
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWANT_QTCLIENT=OFF -DWANT_CORE=OFF -DWANT_MONO=ON
    make
}

package() {
    msg2 "Starting packaging."
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
