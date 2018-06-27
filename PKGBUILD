# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=python-pyxstitch
_name=${pkgname#python-}
pkgver=1.7.7
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-setuptools' 'python-pygments')
optdepends=("bash-completion: for bash completions")
_rawcontent="https://raw.githubusercontent.com/enckse/$_name/v$pkgver/"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${_rawcontent}LICENSE"
        "${_rawcontent}completions/bash"
        "${_rawcontent}doc/$_name.1")
sha256sums=("c81afda5f5ff605570ed07fcd6b5c8a9d54582802ffc312d2a30de1463aef37b"
            "97ed9ee60ca40f39e5ed06c9c4f88d925885e54abcb49b3b364b56b5235b7390"
            "275eb6d18b2a1501bf349ef1b1ac8017630b50786244434cc72cd28aa9169baa"
            "1f4a8201b748cb99ae28f3ed8906427e62d50b53b16ced9ab567c41b365f282d")

build() {
    sed -i "s/<Date>/$(date +"%B %Y")/g;s/<Version>/$pkgver/g" pyxstitch.1
    rm -f *.gz
    gzip pyxstitch.1
}

package() {
    install -Dm644 pyxstitch.1.gz "$pkgdir/usr/share/man/man1/pyxstitch.1.gz"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 bash "$pkgdir/usr/share/bash-completion/completions/pyxstitch"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
