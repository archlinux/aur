# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=cutadapt
_name=cutadapt
pkgver=4.3
pkgrel=1
pkgdesc='Remove adapter sequences from high-throughput sequencing reads. doi:10.14806/ej.17.1.200'
arch=('x86_64')
url="https://github.com/marcelm/cutadapt"
license=('MIT')
depends=(
         'python'
         'python-xopen'
         'python-dnaio'
         )
makedepends=(
            'cython'
            'python-build'
            'python-installer'
            'python-wheel'
            'python-setuptools'
            'python-setuptools-scm'
            )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('319de860f975977e080ea42d9d255322060693ca39b7be51187831311702fe29')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
