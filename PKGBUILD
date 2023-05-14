# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Rusty Russell
# Contributor:  Ludvig Broberg
# Contributor:  Amir Taaki
# Contributor:  The Bitcoin Core Developers

pkgname=python-secp256k1-git
pkgver=1.r0.g0
pkgrel=4

pkgdesc='Python FFI bindings for libsecp256k1'
arch=('any')
url='https://github.com/rustyrussell/secp256k1-py'
license=('MIT')

depends=('python-cffi' 'python-pycparser' 'libsecp256k1' 'coreutils')
provides=('python-secp256k1-git' 'python-secp256k1')
conflicts=('python-secp256k1')

source=('git+https://github.com/rustyrussell/secp256k1-py')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/secp256k1-py/"
    # Append "1." to force update over previous repo versions
    echo -n "1.r$(git rev-list --all --count).g$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/secp256k1-py/"
    env PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
