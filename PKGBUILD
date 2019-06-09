# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=python-proxmoxer
_name=${pkgname#python-}
pkgver=1.0.3
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
sha256sums=('70c3d4cdfdf98dfec57ee0f7ab345da0c4086cb48d8661b5c17c7fbae1ddb090')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
