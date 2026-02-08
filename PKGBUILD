# Maintainer: piotrdab <piotrsbk@gmail.com>
# Contributor: lexa <contact@qexat.com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=babi
pkgver=1.6.1
pkgrel=1
pkgdesc="A text editor, eventually..."
arch=('any')
url="https://github.com/asottile/babi"
license=('MIT')
depends=('python-onigurumacffi>=0.0.18' 'babi-grammars' 'python-identify')
makedepends=('python-build' 'python-installer' 'python-setuptools')
provides=('babi')
conflicts=('babi' 'babi-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9cbdf046eaab517bd34e37b8a944fcb1ff1a0dff6339aac6371e4551ff455d05')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
