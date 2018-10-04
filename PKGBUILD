pkgname=mtg
pkgver=0.14
pkgrel=1
pkgdesc='Bullshit-free MTProto proxy for Telegram'
arch=('x86_64')
url='https://github.com/9seconds/mtg'
license=('MIT')
depends=('glibc')
makedepends=('go')

source=(
     "git+https://github.com/9seconds/mtg#tag=${pkgver}"
     'mtg.service'
     'mtg.sysconfig'
)
sha256sums=(
     'SKIP'
     'eba87814ee66e23928a123126a67804fa9254c60b27163619b8da3a214d88112'
     '271a8765990b46a305b3aebeb08ee1ef63d22d889190ba2c84b50b35b304f6b5'
)

backup=('etc/conf.d/mtg')

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/mtg" "${pkgdir}/usr/bin/mtg"
    install -Dm644 "${srcdir}/mtg.service" "${pkgdir}/usr/lib/systemd/system/mtg.service"
    install -Dm644 "${srcdir}/mtg.sysconfig" "${pkgdir}/etc/conf.d/mtg"
}


