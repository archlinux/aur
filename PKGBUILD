# Maintainer: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
pkgname=gsocket-git
pkgver=1.4.22.r13.gfbe5983
pkgrel=1
pkgdesc='Allows two users behind NAT/Firewall to establish a TCP connection with each other.'
url='https://github.com/hackerschoice/gsocket'
arch=('any')
license=('custom')
makedepends=('git')
source=("$pkgname::git+https://github.com/hackerschoice/gsocket#branch=master")
md5sums=('SKIP')
conflicts=('gsocket')
provides=('gsocket')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname/"
  ./bootstrap
  ./configure --prefix=$pkgdir/usr
  make install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/gsocket/LICENSE"
}

