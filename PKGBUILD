# Maintainer: louipc base64:TG91aSBDaGFuZyA8bG91aXBjLmlzdEBnbWFpbC5jb20+

pkgname=turses-git
pkgver=780.b9992b7
pkgrel=1
pkgdesc="ncurses Twitter client"
arch=('any')
url="https://github.com/louipc/turses"
license=('GPLv3')
depends=('ncurses' 'python' 'python-future' 'python-setuptools' 'python-tweepy' 'python-urwid')
makedepends=('git')
source=("$pkgname::git+https://github.com/louipc/turses.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname}
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

#    sed -i -e 's/future==0.14.3/future==0.15.2/' setup.py
#    sed -i -e 's/tweepy==3.1.0/tweepy==3.5.0/' setup.py
    sed -i -e 's/urwid==1.3.0/urwid/' setup.py
    sed -i -e 's/future==0.14.3/future/' setup.py
    sed -i -e 's/tweepy==3.1.0/tweepy/' setup.py
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
