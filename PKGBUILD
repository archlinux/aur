# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: linuxer <linuxer@artixlinux.org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-nosystemd-git
pkgver=2.2.0
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy"
license=('GPL3')
depends=('bash' 'schedtool' 'python')
makedepends=('git' 'make')
optdepends=('ananicy-s6: s6 support'
            'ananicy-runit: runit support'
            'ananicy-openrc: openrc support')
provides=(ananicy)
conflicts=(ananicy)
source=(git+https://github.com/Nefelim4ag/Ananicy.git#branch=master)
md5sums=('SKIP')
backup=('etc/ananicy.d/ananicy.conf')

pkgver() {
  cd Ananicy
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd Ananicy
  make install PREFIX="$pkgdir"
  mkdir -p "$pkgdir/usr/"
  mv -v "$pkgdir/lib" "$pkgdir/usr/"
}
