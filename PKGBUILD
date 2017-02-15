_pypiname="delegator.py"
pkgbase="python-delegator"
pkgname=("python-delegator" "python2-delegator")
pkgdesc="Subprocesses for Humans 2.0"
url="https://github.com/kennethreitz/delegator.py"
pkgver=0.0.8
pkgrel=2
source=("https://github.com/kennethreitz/delegator.py/archive/v$pkgver.tar.gz")
makedepends=('python-setuptools' 'python2-setuptools')
license=("MIT")
arch=("any")

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    echo ')' >> setup.py  # wtf
    cd "$srcdir"
    cp -r "$_pypiname-$pkgver" "$_pypiname-$pkgver-py2"
}

package_python-delegator() {
    depends=("python" "python-pexpect")
    conflicts=('python-delegator.py')
    provides=('python-delegator.py')
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" -O1
}

package_python2-delegator() {
    depends=("python2" "python2-pexpect")
    conflicts=('python2-delegator.py')
    provides=('python2-delegator.py')
    cd "$srcdir/$_pypiname-$pkgver-py2"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" -O1
}
sha256sums=('e4cd3c831f42b9b380171c038edad9da7efc2a0afb41ca4ea43d12d6b535749a')
