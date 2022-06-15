# Maintainer: fiskhest <johan+sxhkhm at radivoj dot se>

_pkgname=sxhkhm
pkgname=${_pkgname}-git
longpkgname=sxhkd-helper-menu
pkgver=r100.94b04de
pkgrel=1
pkgdesc='Parse and fuzzy-find keybinds from sxhkd-configuration - built from latest sources at github'
arch=('any')
url="https://github.com/fiskhest/aur-${pkgname}"
license=('BSD')
depends=('sxhkd' 'python' 'bash' 'rofi' 'grep' 'fzf')
install=${pkgname}.install
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-pip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/fiskhest/${longpkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$longpkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$longpkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$longpkgname"
    env PATH=$(getconf PATH) python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m 644 sxhkhm.ini "${pkgdir}/usr/share/doc/${_pkgname}/sxhkhm.ini"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
