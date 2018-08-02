pkgname=jupyterlab
pkgver=0.33.4
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
makedepends=('python-setuptools' 'nodejs')
depends=('jupyterlab_launcher')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('dff335537b66ec04b6e759a6d5d9801c211a6701ab1ef03466186ae4b0d993ef')

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
