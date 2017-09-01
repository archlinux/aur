pkgname='art'
pkgver=1.0
pkgrel=1
pkgdesc='Builds Arch Linux package repositories'
arch=('i686' 'x86_64')
url='https://github.com/majewsky/art'
license=('GPL3')
depends=('pacman') # for makepkg, repo-add, repo-remove (also satisfies dependencies on xz and gpg)
optdepends=()
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b5d1b1ea3fcce01989d5b53bce6dbb7f4e2fc94f7266ae024679552ec3ec544f')

options=('!strip') # binaries are already stripped inside the Makefile

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # fix known copy-paste error
    sed -i s/gofu/art/g Makefile
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
