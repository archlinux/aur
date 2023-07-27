# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=pyabpoa
_module=pyabpoa
pkgver=1.4.0
pkgrel=1
pkgdesc='an easy-to-use python interface to abPOA'
arch=('x86_64')
url="https://github.com/yangao07/abPOA"
license=('MIT')
depends=(
         'python'
         'glibc'
         'zlib'
        )
makedepends=(
             'python-build'
             'python-installer'
             'python-wheel'
             'python-nose'
             'cython'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "https://github.com/yangao07/abPOA/blob/main/LICENSE")
sha256sums=('7880aff37e8fcc22cb4806ecc40628521d047df4b5aaf75b679ea82ecb24a335'
            'c3230d968909de1d6b16926d6ed0ffb19c7c3fb792d4041f209ae8a39177f412')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
