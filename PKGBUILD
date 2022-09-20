pkgname=mtg
pkgver=2.1.7
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
sha256sums=('SKIP'
            '180d995169e400f79d28a2c126e2bbc0579db49680d0c7acc48f9963d0a09f22'
            '6ce35a0747812060cac222554dd760db34e4be246dc5b2eecf1de6b217630163')

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/mtg" "${pkgdir}/usr/bin/mtg"
    install -Dm644 "${srcdir}/mtg@.service" "${pkgdir}/usr/lib/systemd/system/mtg@.service"
    install -Dm644 "${srcdir}/example.toml" "${pkgdir}/etc/mtg/example.toml"
}

