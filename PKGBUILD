# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Contributor: SpepS <dreamspepser [at] yahoo.it>
# Contributor: simo <simo [at] archlinux.org>
# Contributor: Tom Newsom <Jeepster [at] gmx.co.uk>

# This version disables xinerama support, fixing two bugs: the impossibility
# to drag objects on the remote screen and the mouse pointer showing up in an
# unexpected position on the remote screen soon after crossing the defined
# border on the local one.
# See also https://bugzilla.redhat.com/show_bug.cgi?id=627164
# The patch proposed there, that disables dga support, does work too, but makes
# the mouse pointer move clumsily on the remote screen; disabling xinerama
# support seems to work better)

pkgname=x2vnc-no-xinerama
_realpkgname=x2vnc
pkgver=1.7.2
pkgrel=5
pkgdesc="Lets you use a monitor on a different computer as if it was connected to the one you are using. This version disables xinerama, fixing two related bugs."
arch=('i686' 'x86_64')
url="http://fredrik.hubbe.net/x2vnc.html"
license=('GPL')
conflicts=('x2vnc')
depends=('libxss' 'libxrandr' 'libxxf86dga')
makedepends=('imake')
source=("http://fredrik.hubbe.net/x2vnc/$_realpkgname-$pkgver.tar.gz")
md5sums=('f23f86bcfa12a80eaeb886ab9b3ee447')

build() {
  cd "$srcdir/$_realpkgname-$pkgver"
  xmkmf
  make
}

package() {
  cd "$srcdir/$_realpkgname-$pkgver"
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir/" install
}
