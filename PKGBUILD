# Maintainer: Arthur Țițeică | arthur dot titeica with gmail

_gitname=exchangelib
_pkgname=python-exchangelib
pkgname=python-exchangelib-git
pkgver=r170.4c30a0f
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD')
depends=('python' 'python-cached-property' 'python-dnspython' 'python-requests-ntlm' 'python-pytz')
makedepends=('python-setuptools' 'git')
source=("git://github.com/ecederstrand/exchangelib.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_gitname}"
    python setup.py build
}

package() {
    cd "$srcdir/${_gitname}"
    python setup.py install -O1 --skip-build --root="${pkgdir}"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

