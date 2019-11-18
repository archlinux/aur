# Maintainer: samæ <samæ at marvid dot fr>

pkgname=dhcpwn-git
pkgver=r29.77ab92a
pkgrel=1
pkgdesc="A tool used for testing DHCP IP exhaustion attacks."
arch=('any')
url="https://github.com/mschwager/dhcpwn"
license=('GPLv3')
groups=()
depends=('python' 'scapy-git')
makedepends=('git')
source=('git+https://github.com/mschwager/dhcpwn')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dhcpwn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dhcpwn"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod +x $pkgdir/usr/lib/python3.5/site-packages/dhcpwn.py

  mkdir $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s /usr/lib/python3.5/site-packages/dhcpwn.py dhcpwn
}
