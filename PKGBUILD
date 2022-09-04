pkgname=pug-hook-noupgrade-git
pkgver=r60.e4bb973
pkgrel=1
pkgdesc='Automatically saves and synchronizes Pacman and AUR installed package lists into Gists.'
arch=('any')
license=('GPL')
depends=('gist')
makedepends=('git')
provides=('pug')
conflicts=('pug')
url='https://github.com/Ventto/pug'
source=('git+https://github.com/Ventto/pug.git'
        'noupgrade.patch')
sha256sums=('SKIP'
            '10154cda5875476d49433f7b74b7e71cb63bd16c6aa1a42560efcd548fc98172')

_srcname=pug

pkgver() {
    cd "${_srcname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_srcname}"
    patch -p1 -i "${srcdir}/noupgrade.patch"
}

package() {
    cd "${_srcname}"
    make DESTDIR="${pkgdir}" install
}
