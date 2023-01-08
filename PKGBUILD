#Maintainer digital mystik <echo ZGlnaXRhbF9teXN0aWtAcHJvdG9ubWFpbC5jaAo= | base64 -d>

_name=trezor-agent
pkgname=python-trezor-agent-git
pkgver=v0.14.6.r6.g3044cfe
pkgrel=1
pkgdesc="Hardware-based SSH/PGP agent (Trezor/Keepkey/Ledger/OnlyKey/Jade)"
arch=('any')
url="https://github.com/romanz/trezor-agent"
license=("LGPL3")
provides=('python-trezor-agent')
conflicts=('python-trezor-agent')
depends=(
         'python' 
         'python-docutils' 
         'python-wheel' 
         'python-backports.shutil_which' 
         'python-trezor' 
         'python-configargparse' 
         'python-daemon' 
         'python-ecdsa' 
         'python-pynacl' 
         'python-mnemonic' 
         'python-pymsgbox' 
         'python-semver' 
         'python-unidecode' 
         'python-bech32' 
         'python-hidapi'
     )
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/romanz/$_name.git#branch=master")

b2sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
    
    #comment or uncomment for agent selection (don't forget to do the same under the package section)
    cd "$srcdir/$pkgname/agents/trezor"
    python setup.py build
    
    #cd "$srcdir/$pkgname/agents/keepkey"
    #python setup.py build
    
    #cd "$srcdir/$pkgname/agents/ledger"
    #python setup.py build

    #cd "$srcdir/$pkgname/agents/onlykey"
    #python setup.py build

    #cd "$srcdir/$pkgname/agents/jade"
    #python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    #comment or uncomment for agent selection
    cd "$srcdir/$pkgname/agents/trezor"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/keepkey"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/ledger"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/onlykey"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/jade"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
