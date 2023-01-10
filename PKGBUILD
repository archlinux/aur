# Maintainer: Brenton Horne <brentonhorne77 at gmail.com>

_name=octave_kernel
pkgname=jupyter-${_name}-git
pkgver=347.git.a613c29
pkgrel=1
pkgdesc="A Jupyter kernel for Octave (git version)"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=('jupyter-metakernel>=0.24.2' 'jupyter-notebook' 'octave')
makedepends=('python-pip')
provides=('jupyter-octave_kernel')
optdepends=('jupyterlab-git: JupyterLab computational environment')
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
