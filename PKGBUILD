# pkgbase=python-ansible
# pkgname=('python-ansible' 'python2-ansible')
pkgname=python-ansible
pkgver=2.2.0.0
pkgrel=1
pkgdesc="Radically simple IT automation"
url="http://ansible.com/"
arch=(any)
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-paramiko' 'python2-paramiko' 'python-jinja' 'python2-jinja' 'python-yaml' 'python2-yaml' 'python-crypto' 'python2-crypto')
source=("https://pypi.python.org/packages/48/da/5e51cf931e4c7849ba698654877e2951ade8f842f28f0c904453a1d317d7/ansible-2.2.0.0.tar.gz")
md5sums=('a19999efedc1b97b91250cda5df73f8a')

prepare() {
  cd "${srcdir}"/ansible-$pkgver
}

build() {
  cp -r "${srcdir}"/ansible-$pkgver "${srcdir}"/ansible-$pkgver-py2

  cd "${srcdir}"/ansible-$pkgver
  python setup.py build

  cd "${srcdir}"/ansible-$pkgver-py2
  python2 setup.py build
}

package_python-ansible() {
  depends=('python-paramiko' 'python-jinja' 'python-yaml' 'python-crypto')

  cd "${srcdir}/ansible-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  rm "${pkgdir}"/usr/bin/ansible*
}

# package_python2-ansible() {
#   depends=('python2-paramiko' 'python2-jinja' 'python2-yaml' 'python2-crypto')
# 
#   cd "${srcdir}/ansible-$pkgver"
#   python2 setup.py install --root=${pkgdir} --optimize=1
# }

