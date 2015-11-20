# Maintainer: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>

pkgname=xkcd-dl-git
pkgver=latest
pkgrel=1
install=$pkgname.install
pkgdesc="Download ALL xkcd's which have been uploaded till date. Ever!"
arch=('any')
license=('MIT')
depends=('python' 'python-wheel' 'python-requests' 'python-beautifulsoup4' 'python-docopt' 'python-magic>=0.4.10')
makedepends=('python' 'python-setuptools')
url='https://github.com/prodicus/xkcd-dl'
provides=(xkcd-dl)

source=('git+https://github.com/prodicus/xkcd-dl'
        'versions.patch')
sha256sums=('SKIP'
            '151499395b685ec4456da8dbefeaa444222e8e025aa08f19547a4a2566f27254')

_reponame='xkcd-dl'

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_reponame"
  patch -p1 <"$srcdir/versions.patch"
}

package() {
    cd "$srcdir/$_reponame"
    python setup.py install --prefix=/usr --root="$pkgdir/" --single-version-externally-managed -O2
}
