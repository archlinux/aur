pkgname=jupyterlab
pkgver=0.32.0
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
depends=(jupyterlab_launcher)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('dd628ff07883906b08b12e77cd6fd2f6c819e889c2111941f27d6084dd2f7e5b')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # symlink to fix assets
  install -d "$pkgdir"/usr/share/jupyter
  ln -s "$pkgdir"/usr/lib/python3.6/site-packages/jupyterlab "$pkgdir"/usr/share/jupyter/lab
}
