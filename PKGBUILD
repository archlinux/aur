# Maintainer: Flaviu Tamas <me@flaviutamas.com>

pkgname=docker2hosthosts
pkgver=0.1.1
pkgrel=1
pkgdesc="Updates the host system's /etc/hosts whenever containers go up or down."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/flaviut/docker2hosthosts'
license=('Apache')
depends=('openssl')
makedepends=('cargo')
source=("https://github.com/flaviut/${pkgname}/archive/v${pkgver}.tar.gz")

md5sums=('ac5681d355938453c0e237d33c80f600')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "target/release/docker2hosthosts" -t "${pkgdir}/usr/bin/"
    install -Dm644 "docker2hosthosts.service" -t "${pkgdir}/usr/lib/systemd/system/"
}

