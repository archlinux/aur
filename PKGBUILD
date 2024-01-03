# Maintainer: VVL <me@ivvl.ru>

pkgname=zitadel-bin
pkgver=2.43.0
pkgrel=1
pkgdesc="Identity infrastructure, simplified for you"
arch=('x86_64')
url="https://github.com/zitadel/zitadel/"
optdepends=('postgresql: PostgreSQL database'
            'cockroachdb: CockroachDB database'
            'nginx: reverse-proxy')
conflicts=('zitadel')
license=('Apache License 2.0')
source=("https://github.com/zitadel/zitadel/releases/download/v${pkgver}/zitadel-linux-amd64.tar.gz"
        "zitadel.service"
        "zitadel.sysusers"
        "zitadel.tmpfiles"
        "config.yaml")
sha512sums=('60ec52a13e91f46ed3dffd09389d5c9123b256f3df39bbbbcc4e89314ac1f232a622c5b5e07506d0c23a6237b02a14bc07b1f45463091e7493b9325c7c63f417'
            '0ceacb54d3073637291f753b08053f2d408f6e9f7b033146d83c0897156ad4891c5ba14ea28d1b73124ebdc9659fe1cffdbe1dfbf7d215ab3b836993c0a77fcc'
            'f497d8fdc43327a7bacc957b6c583a3dd81f3d1fe387869463cb23c5c0a8efcd04772f3fc528c528ebc6cb55d29e0d11ddf73bc7db7cf61655267b964bcc2f12'
            '7b847d89fb3d231d25a053b0a9a7fee2b184d17553b321fc403c86b122f349a65346a7e1522e1caa7e2c2dcef742358322e85ea1c2a0dd578e6e180a19553508'
            'c8beaaf1beecf3d8df7b1b8f6a954911d76e64dc26faabb8f58f5ef5029849f7297719814c898bb002eb21b36d3e7221d1ffcd47cec3d6b326c8e3e7d43dd5bf')
backup=('etc/zitadel/master.key'
        'etc/zitadel/config.yaml')
install="zitadel.install"

package() {
  install -d "${pkgdir}/usr/bin/"
  install -Dm 755 ${srcdir}/zitadel-linux-amd64/zitadel "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/zitadel.service" "${pkgdir}/usr/lib/systemd/system/zitadel.service"
  install -Dm 644 "${srcdir}/zitadel.sysusers" "${pkgdir}/usr/lib/sysusers.d/zitadel.conf"
  install -Dm 644 "${srcdir}/zitadel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/zitadel.conf"
  install -Dm 644 "${srcdir}/config.yaml" "${pkgdir}/etc/zitadel/config.yaml"
}
