pkgname=jupyterlab
pkgver=0.33.0
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
makedepends=('python-setuptools' 'nodejs')
depends=('jupyterlab_launcher')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('5f7a1e67892db43e9b7b44793da9a12822d966446a8bfeb02328d02cfb07ec8a')

build() {
  cd $pkgname-$pkgver
  sed -i "s|jupyterlab_launcher>=0.10.0,<0.11.0|jupyterlab_launcher>=0.10.0|g" setup.py
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
