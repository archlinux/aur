# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-parquet-tools'
_name='parquet_tools'
pkgver='0.2.14'
pkgrel=1
pkgdesc="Easy install parquet-tools"
url="https://github.com/ktrueda/parquet-tools"
depends=(
    'python>=3.8'
    'python-halo>=0.0.29' 'python-halo<0.1.0'
    'python-pyarrow'
    'python-pandas>=1'
    'python-tabulate>=0.8.7' 'python-tabulate<1.0.0'
    'python-boto3>=1.13' 'python-boto3<2.0'
    'python-thrift>=0.13.0' 'python-thrift<1'
    'python-colorama>=0.4.3' 'python-colorama<0.5.0'
)

makedepends=(python-build python-installer python-poetry)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bde8c882ab407752459dd4a7bf9677e79528c12b91783b3621ce210676972a9c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
