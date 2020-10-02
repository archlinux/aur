# Maintainer: Bao Trinh <qubidt at gmail>
# Contributor: Bastien Traverse <firstname at lastname dot email>

pkgname=python-proxmoxer
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=2
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
sha256sums=('684a69190129da0f102703fc9861f5eea82a7d804f9f96d35c7fd73452f1da7e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  # remove tests because they interfere with other system packages
  sed -i "s/, 'tests', 'tests.base'//" setup.py
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
