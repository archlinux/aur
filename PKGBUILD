pkgname=jupyterlab
pkgver=0.33.6
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
makedepends=('python-setuptools' 'nodejs')
depends=('jupyterlab_launcher')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('c7eea3699d2f740ae5d32304e80aaaac20bca5add680251cd6756c4029d8f9e3')

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
  ln -s /usr/lib/python3.6/site-packages/jupyterlab "$pkgdir"/usr/share/jupyter/lab
}
