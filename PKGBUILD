# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

pkgname=openpyn-nordvpn
pkgver=2.2.0.r273.gd329ec2
pkgrel=1
pkgdesc="Easily connect to and switch between OpenVPN servers hosted by NordVPN"
provides=('python-openpyn' 'openpyn-nordvpn')
arch=('any')
url="https://github.com/jotyGill/openpyn-nordvpn"
license=('GPLv3')
depends=('openvpn' 'systemd' 'python-humanfriendly' 'python-requests' 'python-colorama' 'python-coloredlogs' 'python-verboselogs' 'wget' 'unzip')
makedepends=('python-setuptools')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/jotyGill/openpyn-nordvpn.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}"/${pkgname}
  python setup.py build
}

package() {
  cd "${srcdir}"/${pkgname}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}
