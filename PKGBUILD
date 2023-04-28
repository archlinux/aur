# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=cutadapt
_name=cutadapt
pkgver=4.4
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
sha256sums=('4554157c673022e1c433fcd6e3b803008fef60c8e71c01215e4aa04b0f09fe83')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
