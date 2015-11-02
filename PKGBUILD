# Maintainer: Ashwin <ashuwish+arch@gmail.com>

pkgname=python2-fluiddyn-hg
pkgver=0.0.12a
pkgrel=0
pkgdesc="FluidDyn project | Framework for studying fluid dynamics."
_hgproj=fluiddyn
_hgrepo=fluiddyn
arch=('any')
url="https://bitbucket.org/${_hgproj}/${_hgrepo}"
license=('custom:"CeCILL-B"')
depends=('python2' 'python2-numpy' 'python2-psutil' 
	 'python2-matplotlib')
makedepends=('mercurial' 'python2-setuptools' 'python2-six' 'python2-ptyprocess')
provides=('python2-fluidsim-hg')

source=("hg+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_hgrepo}/${_hgrepo}"
  python2 -c "from _version import __version__; print __version__"
}

pkgrel() {
  cd "${srcdir}/${_hgrepo}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
