# Maintainer: ratata

pkgname=minq-ananicy-git
pkgver=2.2.1.r69.gcc83639
pkgrel=1
pkgdesc="Minq Ananicy - fork of Ananicy with support for cmdline and more frequently updated rules"
arch=('any')
url="https://github.com/kuche1/minq-ananicy"
license=('GPL3')
depends=('systemd' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("$pkgname"::'git+https://github.com/kuche1/minq-ananicy.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install
provides=(ananicy)
backup=( 'etc/ananicy.d/ananicy.conf' )

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname}/"
  make install PREFIX="$pkgdir"
  mkdir -p "$pkgdir/usr/"
  mv -v "$pkgdir/lib" "$pkgdir/usr/"
}
