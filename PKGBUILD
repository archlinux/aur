# Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

pkgname=python-praw-git
pkgver=4.0.0b11.r1580.g074bbe1
pkgrel=1
pkgdesc="A python package that allows for simple access to reddit's API"
arch=('any')
url="https://github.com/praw-dev/praw"
license=('GPL3')
depends=('python-decorator' 'python-six' 'python-requests' 'python-update_checker-git')
makedepends=('git' 'python-setuptools')
provides=('python-praw')
conflicts=('python-praw')
source=(${pkgname}::'git+https://github.com/praw-dev/praw.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "%s.r%s.g%s" "$(grep __version__ praw/const.py | head -1 | cut -d"'" -f2)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
