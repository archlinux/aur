# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=cutadapt
_name=cutadapt
pkgver=4.2
pkgrel=2
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
sha256sums=('ab0ac450baecc1576cc5ccbc06eab2685be9ee7676763938237d954a644237f1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
