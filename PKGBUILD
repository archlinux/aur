# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-parquet-tools'
_name='parquet_tools'
pkgver='0.2.12'
pkgrel=1
pkgdesc="Easy install parquet-tools"
url="https://github.com/ktrueda/parquet-tools"
depends=(
    'python>=3.8'
    'python-halo>=0.0.29' 'python-halo<0.1.0'
    'python-pyarrow'
    'python-pandas>=1' 'python-pandas<=2'
    'python-tabulate>=0.8.7' 'python-tabulate<1.0.0'
    'python-boto3>=1.13' 'python-boto3<2.0'
    'python-thrift>=0.13.0' 'python-thrift<1'
    'python-boto3>=1.13' 'python-boto3<=2'
    'python-colorama>=0.4.3' 'python-colorama<0.5.0'
)

makedepends=(python-build python-installer python-poetry)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8deb439408d53ee7d2a89568c553e9e619915a13a452e0dd72e67a49e5f0867a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
