#Maintainer: digital mystik <dgtl_mystik at protonmail dot ch>

_name=trezor-agent
pkgname=python-trezor-agent
pkgver=0.14.2
pkgrel=2
pkgdesc="Using hardware wallets as SSH/GPG agent"
arch=('any')
url="https://github.com/romanz/trezor-agent"
license=("LGPL3")
depends=('python' 'python-docutils' 'python-wheel' 'python-shutilwhich' 'python-trezor' 
         'python-configargparse' 'python-daemon' 'python-ecdsa' 'python-pynacl' 
         'python-mnemonic' 'python-pymsgbox' 'python-semver' 'python-unidecode')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/romanz/$_name/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/romanz/$_name/v$pkgver/agents/trezor/setup.py"
        "https://raw.githubusercontent.com/romanz/$_name/v$pkgver/agents/trezor/trezor_agent.py")

b2sums=('7f1623e0b7c2e096c04ee0d6cb3dfe24191f8f935fbec64862427ac4a6430ed362e2b416b6906e367d328b6197be16a1ded856bac28a88999a102b585448f07c'
        '94b918a12cefb206c25037431701ec132b7520c913a90c362de4970b45289aa7018201253891116e6e0947703c3a05a429a2e30496a79eac99d6417630ad2d05'
        'df0176f5fd484c2ca50b29cadb4731dfcea2b078d7dc61f6a220c4bea6ce656a805262e61be05c827b07b0491d2c54f9b47cfcb2bdb947910831f88dbd3f65fb')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
    cd ..
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cd ..
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
