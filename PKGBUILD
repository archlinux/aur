pkgname=mtg
pkgver=2.1.2
pkgrel=1
pkgdesc='Bullshit-free MTProto proxy for Telegram'
arch=('x86_64' 'armv7h' 'aarch64') # possibly others?
url='https://github.com/9seconds/mtg'
license=('MIT')
depends=('glibc')
makedepends=('go')
install='mtg.install'

source=(
    "git+https://github.com/9seconds/mtg#tag=v${pkgver}"
    'mtg@.service'
    'example.toml'
)
sha256sums=(
    'SKIP'
    '4409cccf793cf393d53b63646b0ccc30e3d46683edb30352eb7f7e26f3f71afa'     
    'efbc6956fb3d98080011360265d77fa1cbd9d1b8261670b96f08b3d35d02c51e'
)

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/mtg" "${pkgdir}/usr/bin/mtg"
    install -Dm644 "${srcdir}/mtg@.service" "${pkgdir}/usr/lib/systemd/system/mtg@.service"
    install -Dm644 "${srcdir}/example.toml" "${pkgdir}/etc/mtg/example.toml"
}
