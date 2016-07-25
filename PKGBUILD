# Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>


pkgname=python-prawcore-git
pkgver=.r128.gdb0fdb9
pkgrel=1
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
url="https://github.com/praw-dev/prawcore"
license=('GPL3')
depends=('python-decorator' 'python-six' 'python-requests' )
makedepends=('git' 'python-setuptools')
provides=('python-prawcore')
conflicts=('python-prawcore')
source=(${pkgname}::'git+https://github.com/praw-dev/prawcore.git')
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
