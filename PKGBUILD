pkgname=seerrng-bin
pkgver=3.12.0
pkgrel=1
pkgdesc='Standalone media request and discovery service with optional external service integrations'
arch=('x86_64')
url='https://github.com/snapetech/seerrng'
license=('MIT')
depends=('nodejs>=22')
provides=('seerrng')
conflicts=('seerrng')
install=seerrng.install
source=("https://github.com/snapetech/seerrng/releases/download/v${pkgver}/seerrng-v${pkgver}-linux-x64.tar.gz"
        'seerrng.service'
        'seerrng.env'
        'seerrng.sysusers'
        'seerrng.tmpfiles')
sha256sums=('f3278633842bd58bbedde6a1d57c95799a220b8b6e0319a5e5f37173cb67ed32' '5f85a0dbe7d1e8b07da64ec70ff2aed89c86447b6a2af53535c94073e07ccbe0' '04e10455e5e5a6032f0eda5ae0dc78f53de24ff7b1f2bef98050c33b9d3c0f30' '2d838557b8d3976095299731450c4fd665d29b2dc5f27d13bcba7d5ea4c3569f' 'be404a3b331f0fe01e1755c7cd54ed70ce9cd2758d037f8391aaedfef11d2319')

package() {
  install -dm755 "${pkgdir}/usr/lib/seerrng" "${pkgdir}/usr/bin" "${pkgdir}/etc/seerrng" \
    "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/lib/sysusers.d" "${pkgdir}/usr/lib/tmpfiles.d"
  cp -a "seerrng-v${pkgver}-linux-x64/." "${pkgdir}/usr/lib/seerrng/"
  install -Dm644 seerrng.service "${pkgdir}/usr/lib/systemd/system/seerrng.service"
  install -Dm644 seerrng.env "${pkgdir}/etc/seerrng/seerrng.env"
  install -Dm644 seerrng.sysusers "${pkgdir}/usr/lib/sysusers.d/seerrng.conf"
  install -Dm644 seerrng.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/seerrng.conf"
  ln -s /usr/lib/seerrng/start.sh "${pkgdir}/usr/bin/seerrng"
}
