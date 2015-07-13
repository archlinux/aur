# Maintainer: David Mougey <imapiekindaguy at gmail dot com>

pkgname=python-update_checker-git
pkgver=0.11.r21.g4e69589
pkgrel=1
pkgdesc="A python module that will check for package updates."
arch=('any')
url="http://github.com/bboe/update_checker"
license=('BSD 2-Clause')
depends=('python-requests')
makedepends=('git' 'python-setuptools')
provides=('python-update_checker')
conflicts=('python-update_checker')
source=(${pkgname}::'git+https://github.com/bboe/update_checker.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "%s.r%s.g%s" "$(grep __version__ update_checker.py | grep -oP '([0-9]{1,2}(\.){0,1}){2}')" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
