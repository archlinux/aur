pkgname='art'
pkgver=1.1
pkgrel=1
pkgdesc='Builds Arch Linux package repositories'
arch=('i686' 'x86_64')
url='https://github.com/majewsky/art'
license=('GPL3')
depends=('pacman') # for makepkg, repo-add, repo-remove (also satisfies dependencies on xz and gpg)
optdepends=(
    'holo-build: to build packages from *.pkg.toml files'
)
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e2c9fd9fd7a5d906f22adcd4d808a92af872835ca72bb3118f8574599deff815')

options=('!strip') # binaries are already stripped inside the Makefile

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
