_engine='crustygame'
pkgname='crustris'
pkgver='0.3'
pkgrel=1
license=('GPL3')
pkgdesc='Retro style 2D Tetris game using the crustygame engine.'
url='https://github.com/paulguy/crustygame'
arch=('i686' 'x86_64')
depends=('sdl2')
makedepends=('sdl2')
source=(
    "${_engine}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "crustris.sh"
)
sha256sums=(
    '98441d8cd19706e720195fc0c68e699008bfd1f49513d678c283f91ab4c2b644'
    '1e846c139a1d8b1543f8c42eb63c7d41501afbeb23bbe350920fc6ca09214be0'
)

build() {
    cd "${srcdir}/${_engine}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_engine}-${pkgver}"

    # Prepare crustris shared resources.
    install -Dm644 ./examples/crustris.cvm \
        "${pkgdir}/usr/share/crustris/crustris.cvm"
    cp -r ./examples/crustris_files \
        "${pkgdir}/usr/share/crustris/crustris_files"
    cp -r ./examples/lib "${pkgdir}/usr/share/crustris/lib"

    # Install documentation: README and README.crustris
    # into /usr/share/doc/crustygame.
    install -Dm644 ./examples/README "${pkgdir}/usr/share/doc/crustris/README"
    install -Dm644 ./README "${pkgdir}/usr/share/doc/crustris/README.crustygame"

    # Install the crustygame launcher and crustris script.
    install -Dm755 ./crustygame "${pkgdir}/usr/bin/crustygame"
    install -Dm755 "${srcdir}/crustris.sh" "${pkgdir}/usr/bin/crustris"
}
