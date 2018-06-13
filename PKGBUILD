# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=python-proxmoxer
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Python Wrapper for the Proxmox 2.x API (HTTP and SSH)"
arch=('any')
url="https://github.com/swayf/proxmoxer"
license=('MIT')
depends=('python')
optdepends=('python-requests: for https backend'
			'python-paramiko: for ssh_paramiko backend'
			'python-openssh-wrapper: for openssh backend')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2a7b3718e684facc7d3678e6c8f91e1a1c4c78dc1eba8904239970b4c21aeb6e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
