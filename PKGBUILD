# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgbase=python-distributed
pkgname=('python-distributed' 'python2-distributed')
_pkgname=distributed
pkgver=1.25.1
pkgrel=1
pkgdesc="A python library for distributed computation."
arch=('any')
url="http://distributed.readthedocs.org/en/stable/"
license=('BSD-3-clause')
source=(https://codeload.github.com/dask/distributed/tar.gz/$pkgver)
sha256sums=('139b630f697a7463c0acb7d730e9cdcf2ab44177e63150ac887788dbe533f97e')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

package_python-distributed() {
  depends=('python>=3.5' 'python-click>=6.6' 'python-cloudpickle>=0.2.2' 
    'python-dask>=0.18.0' 'python-msgpack' 'python-psutil>=5.0' 'python-six'
    'python-sortedcontainers>2.0.1' 'python-tblib' 'python-toolz>=0.7.4'
    'python-tornado>=4.5.1' 'python-zict>=0.1.3' 'python-yaml')
  # For supporting older versions of python 3:
  # singledispatch; python_version < '3.4'
  optdepends=(
    # dev-requirements.txt
    'python-joblib>=0.10.2' 'python-mock>=2.0.0' 'python-pandas>=0.19.2'
    'python-numpy>=1.11.0' 'python-bokeh>=0.12.3' 'python-requests>=2.12.4'
    'python-pyzmq>=16.0.2' 'ipython>=5.0.0' 'python-jupyter_client>=4.4.0'
    'python-ipykernel>=4.5.2' 'python-pytest>=3.0.5'
    # pytest.importorskip
    'python-keras' 'python-lz4' 'python-netcdf4' 'python-h5py'
    'python-paramiko' 'python-ipywidgets' # crick, hdfs-3
  )
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_python2-distributed() {
  depends=('python2' 'python2-click>=6.6' 'python2-cloudpickle>=0.2.2' 
    'python2-dask>=0.18.0' 'python2-msgpack' 'python2-psutil>=5.0' 'python2-six'
    'python2-sortedcontainers>2.0.1' 'python2-tblib' 'python2-toolz>=0.7.4'
    'python2-tornado>=4.5.1' 'python2-zict>=0.1.3' 'python2-yaml'
    'python2-futures' 'python2-singledispatch')
  optdepends=(
    # dev-requirements.txt
    'python2-joblib>=0.10.2' 'python2-mock>=2.0.0' 'python2-pandas>=0.19.2'
    'python2-numpy>=1.11.0' 'python2-bokeh>=0.12.3' 'python2-requests>=2.12.4'
    'python2-pyzmq>=16.0.2' 'ipython2>=5.0.0' 'python2-jupyter_client>=4.4.0'
    'python2-ipykernel>=4.5.2' 'python2-pytest>=3.0.5'
    # pytest.importorskip
    'python2-keras' 'python2-lz4' 'python2-netcdf4' 'python2-h5py'
    'python2-paramiko' 'python2-ipywidgets' # crick, hdfs-3
  )
  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}
