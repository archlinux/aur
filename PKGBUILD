# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=python-pyxstitch
_name=${pkgname#python-}
pkgver=1.7.8
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
        "${_rawcontent}resources/bash.completions"
        "${_rawcontent}resources/$_name.1")
sha256sums=("4c51608ae5a346649b25bbf7ad15812774be7a7826f5e5e8f16491bce82ad7e0"
            "97ed9ee60ca40f39e5ed06c9c4f88d925885e54abcb49b3b364b56b5235b7390"
            "275eb6d18b2a1501bf349ef1b1ac8017630b50786244434cc72cd28aa9169baa"
            "6074550d08d10bec5c285ab567b8b5c286e13d1af6cb5d878f70cf447f623d35")

build() {
    sed -i "s/<Version>/$pkgver/g" pyxstitch.1
    rm -f *.gz
    gzip pyxstitch.1
}

package() {
    install -Dm644 pyxstitch.1.gz "$pkgdir/usr/share/man/man1/pyxstitch.1.gz"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 bash.completions "$pkgdir/usr/share/bash-completion/completions/pyxstitch"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
