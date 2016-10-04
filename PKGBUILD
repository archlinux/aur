# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: speps <speps at aur dot archlinux dor org>

pkgname=qmidinet-git
pkgver=136.9e0494f
pkgrel=1
pkgdesc="A MIDI Network Gateway via UDP/IP Multicast (git version)"
arch=(i686 x86_64)
url="http://qmidinet.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'alsa-lib' 'jack')
provides=('qmidinet')
conflicts=('qmidinet')
install="$pkgname.install"
source=("$pkgname::git+git://git.code.sf.net/p/qmidinet/code")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
