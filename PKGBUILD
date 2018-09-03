# Maintainer: Ainola
# Contributor: Felix Yan <felixonmars@archlinux.org> (Stable Package)

pkgbase=python-google-auth-httplib2-git
pkgname=(python-google-auth-httplib2-git python2-google-auth-httplib2-git)
pkgver=r8.e7cd722
pkgrel=1
pkgdesc="Google Authentication Library: httplib2 transport"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-google-auth' 'python2-google-auth'
             'python-httplib2' 'python2-httplib2' 'python-six' 'python2-six')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-mock' 'python2-mock'
              'python-flask' 'python2-flask' 'python-pytest-localserver'
              'python2-pytest-localserver')
provides=('python-google-auth-httplib2' 'python2-google-auth-httplib2')
conflicts=('python-google-auth-httplib2' 'python2-google-auth-httplib2')
source=("git+https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2.git")
sha512sums=('SKIP')

pkgver() {
    cd google-auth-library-python-httplib2
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -a google-auth-library-python-httplib2{,-py2}
}

build() {
    cd "$srcdir/google-auth-library-python-httplib2"
    python setup.py build

    cd "$srcdir/google-auth-library-python-httplib2-py2"
    python2 setup.py build
}

check() {
    cd "$srcdir/google-auth-library-python-httplib2"
    python setup.py pytest

    cd "$srcdir/google-auth-library-python-httplib2"
    python2 setup.py pytest
}

package_python-google-auth-httplib2-git() {
    depends=('python-google-auth' 'python-httplib2' 'python-six')

    cd "google-auth-library-python-httplib2"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-google-auth-httplib2-git() {
    depends=('python2-google-auth' 'python2-httplib2' 'python2-six')

    cd "google-auth-library-python-httplib2-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

