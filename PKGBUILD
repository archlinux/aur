# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python2-ipywidgets
pkgver=7.5.1
pkgrel=4
pkgdesc="IPython widgets for the Jupyter Notebook"
arch=('any')
url="https://github.com/ipython/ipywidgets"
license=('BSD')
depends=('python2' 'jupyter-widgetsnbextension')
makedepends=('python2-setuptools' 'npm' 'git')

source=("$pkgname-$pkgver.tgz::https://github.com/ipython/ipywidgets/archive/$pkgver.tar.gz")
md5sums=('fd7d28cfd8a1206e95e5161a1b924a91')

build() {
  cd "$srcdir/ipywidgets-$pkgver"
  # needs node, downloads a lot of stuff, probably not reproducible
  python2 setup.py build
  #cd widgetsnbextension
  #python2 setup.py build
}

package() {
  cd "$srcdir/ipywidgets-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #cd widgetsnbextension
  #python2 setup.py install --prefix=/usr --root="$pkgdir"
}

