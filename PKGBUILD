# Maintainer: Brenton Horne <brentonhorne77 at gmail.com>

_name=scilab_kernel
pkgname=jupyter-${_name}-git
pkgver=135.git.b2e9069
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/scilab_kernel"
license=('MIT')
depends=('jupyter' 'jupyter-metakernel>=0.24.2' 'jupyter-notebook' 'scilab-bin')
makedepends=('python-pip')
optdepends=('gnuplot: for making plots' 'jupyterlab: JupyterLab computational environment')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
  cd $srcdir/$_name
  no=$(git rev-list --count HEAD)
  hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
  printf "${no}.git.${hash}"
}

build() {
  cd "$srcdir"/$_name
  python setup.py build
}

package() {
  cd "$srcdir"/$_name
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
