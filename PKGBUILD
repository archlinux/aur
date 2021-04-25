# Contributor: Phil Ruffwind <rf@rufflewind.com>
pkgname=python2-fastimport-git
pkgver=latest
pkgrel=1
pkgdesc='VCS fastimport/fastexport parser'
arch=(any)
url=https://pypi.python.org/pypi/fastimport
license=('GPL')
depends=(python2)
makedepends=(git python2-distutils-extra python2-setuptools)
provides=(python2-fastimport)
conflicts=(python2-fastimport)
source=($pkgname::git+https://github.com/jelmer/python-fastimport)
sha512sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    s=`git 2>/dev/null describe --long --tags | sed 's/^fastimport-//'`
    if [ $? -eq 0 ]
    then
        printf '%s' "$s" | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "`git rev-list --count HEAD`" \
               "`git rev-parse --short HEAD`"
    fi
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
