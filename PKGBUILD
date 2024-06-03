# Maintainer: gardar <aur@gardar.net>
# Contributor: kmille <aur@androidloves.me>
# Contributor: Matt Parnell <parwok@gmail.com>

pkgname=vpn-slice-systemd-resolved-git 
_pkgname=vpn-slice
provides=(vpn-slice)
conflicts=(vpn-slice vpn-slice-git)
pkgver=v0.16.1.r25.g8836aa6
pkgrel=2
pkgdesc="Python based vpnc-script replacement for easy and secure split-tunnel VPN setup with systemd-resolved support"
arch=('any')
url="https://github.com/dlenski/vpn-slice"
license=('GPL')
makedepends=(git python-setuptools)
depends=(python python-setproctitle python-dnspython bind-tools iproute2 iptables)
source=('git+https://github.com/dlenski/vpn-slice#branch=Linux_split_DNS_PR118_rework')
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
