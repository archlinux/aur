# Maintainer: kmille aur@androidloves.me
# Contributer: Matt Parnell <parwok@gmail.com>

pkgname=vpn-slice-git
_pkgname=vpn-slice
pkgver=v0.16.1.r25.g8836aa6
pkgrel=1
pkgdesc="Python based vpnc-script replacement for easy and secure split-tunnel VPN setup"
arch=('any')
url="https://github.com/dlenski/vpn-slice"
license=('GPL')
makedepends=(git python-setuptools)
depends=(python python-setproctitle python-dnspython bind-tools iproute2 iptables)
source=(git+https://github.com/dlenski/vpn-slice)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
