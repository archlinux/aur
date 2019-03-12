# Maintainer: Bailey Fox <bfox200012@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Étienne André <eti.andre@gmail.com>

pkgname='python-fusepy'
_module=${pkgname#python-}
pkgver=3.0.1
pkgrel=2
pkgdesc='Simple ctypes bindings for FUSE'
url='https://github.com/fusepy/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse2>=2.6' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('72ff783ec2f43de3ab394e3f7457605bf04c8cf288a2f4068b4cde141d4ee6bd')

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
