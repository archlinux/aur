pkgname='art'
pkgver=1.2
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
sha256sums=('4e795cf2102ce0aa329fed288b38b4e3849dd587038fc170c58f717cc00ccc13')

options=('!strip') # binaries are already stripped inside the Makefile

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
