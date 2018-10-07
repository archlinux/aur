pkgname='art'
pkgver=2.0
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
sha256sums=('527b3acd0e52c846cfbb2275e2c2da4f2a6938904eef379ed8563e01dbcda718')

options=('!strip') # binaries are already stripped inside the Makefile

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
