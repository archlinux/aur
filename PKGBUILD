pkgname=mtg
pkgver=1.0
pkgrel=3
pkgdesc='Bullshit-free MTProto proxy for Telegram'
arch=('x86_64')
url='https://github.com/9seconds/mtg'
license=('MIT')
depends=('glibc')
makedepends=('go')
install='mtg.install'

source=(
    'git+https://github.com/9seconds/mtg#commit=112d3a916c7e74226e2eacc794ff575a79a21037' # 1.0 isn't tagged (yet?)
    'mtg@.service'
    'example.conf'
)
sha256sums=(
    'SKIP'
    '6b2d2f424f75016ae158c278919fe9622fc983e2c038b44328975944518a2ce7'     
    '271a8765990b46a305b3aebeb08ee1ef63d22d889190ba2c84b50b35b304f6b5'
)

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/mtg" "${pkgdir}/usr/bin/mtg"
    install -Dm644 "${srcdir}/mtg@.service" "${pkgdir}/usr/lib/systemd/system/mtg@.service"
    install -Dm644 "${srcdir}/example.conf" "${pkgdir}/etc/mtg/example.conf"
}

