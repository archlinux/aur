# Maintainer: lsf
# Contributor: Ross Chadwick <hello@rchadwick.co.uk>

pkgname=nordnm-git
_gitname=NordVPN-NetworkManager
_basename=nordnm
provides=("$_basename")
conflicts=("$_basename")
pkgver=0.7.1.r29.g6f77aff
pkgrel=1
pkgdesc="A CLI tool for automating the importing, securing and usage of NordVPN OpenVPN servers through NetworkManager."
url="https://github.com/Chadsr/NordVPN-NetworkManager"
depends=('python' 'iputils' 'sudo' 'networkmanager' 'openvpn'
         'networkmanager-openvpn' 'python-requests' 'python-numpy' 'systemd')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=('git+https://github.com/Chadsr/NordVPN-NetworkManager.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe  --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
