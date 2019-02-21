pkgname='pacaur-git'
_pkgname="${pkgname/-git}"
pkgver=4.7.90.26.gb75157f
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction'
arch=('any')
url="https://github.com/E5ten/${_pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git')
makedepends=('perl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/xdg/${_pkgname}/config")
source=("git+https://github.com/E5ten/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git describe --always | sed 's/-/./g')
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    _pkgver=$(git describe --always | sed 's/-/./g')
    sed -i "s/version=\"[0-9].[0-9].[0-9]*\"/version=\"$_pkgver\"/g" "./${_pkgname}"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}

