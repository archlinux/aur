# Maintainer: DanManN <dnahimov@gmail.com>

pkgname=python-qiskit-sdk-git
pkgver=0.7.0.r2162.2fa71f56
pkgrel=6
pkgdesc="Python software development kit for writing quantum computing experiments, programs, and applications."
arch=('any')
url="http://www.qiskit.org"
license=('Apache-2.0')
groups=('QISKit')
depends=('python'
         'python-psutil'
         'python-jsonschema'
         'python-networkx'
         'python-ply'
         'python-numpy'
         'python-scipy'
         'python-matplotlib'
         'python-pillow'
         'python-sympy'
         'python-qiskit-api')
makedepends=('git'
             'cmake'
             'python-setuptools'
             'python-pylint'
             'python-pycodestyle'
             'python-sphinx'
             'python-sphinxcontrib-fulltoc'
             'python-coverage'
             'python-better-apidoc'
             'python-wheel')
checkdepends=('python-vcrpy')
provides=('python-qiskit-sdk')
conflicts=('python-qiskit-sdk')
source=("git+https://github.com/QISKit/qiskit-terra.git")
md5sums=('SKIP')

prepare() {
  cd qiskit-terra
  git checkout $(curl https://api.github.com/repos/QISKit/qiskit-terra/releases | grep tag_name | cut -d '"' -f4 | head -n 1)
}

pkgver() {
  cd qiskit-terra
  printf "%s.r%s.%s" "$(cat qiskit/VERSION.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd qiskit-terra
  cmake .
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
