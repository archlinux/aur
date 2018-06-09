
# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="python-romkan-git"
_pkgname="python-romkan"
pkgver=r24.c82dc16
pkgrel=1
pkgdesc="a Romaji/Kana conversion library for Python"
arch=('any')
url="https://github.com/soimort/python-romkan"
license=('BSD')
depends=('python')
makedepends=('git')
provides=('python-romkan')
source=("git+https://github.com/soimort/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_pkgname}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
    rm -rf .git*
    
    python setup.py install --root="${pkgdir}" --optimize=1
    
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
