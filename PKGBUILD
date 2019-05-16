pkgname=mtg
pkgver=0.15.1.1
pkgrel=1
pkgdesc='Bullshit-free MTProto proxy for Telegram'
arch=('x86_64')
url='https://github.com/9seconds/mtg'
license=('MIT')
depends=('glibc')
makedepends=('go')

source=(
     "git+https://github.com/9seconds/mtg#commit=78dea9ae3f0770af0fa32068d1839be7d5c7a5c3"
     'mtg.service'
     'mtg.sysconfig'
)
sha256sums=(
     'SKIP'
     '7590e1d27640e90129d94ef54d7091239fabde93a327717e4d04c6d7eebc0414'     
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


