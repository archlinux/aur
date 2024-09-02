# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=zitadel
pkgver=2.60.0
pkgrel=1
pkgdesc="Identity infrastructure, simplified for you"
arch=('x86_64')
url="https://github.com/zitadel/zitadel/"
optdepends=('postgresql: PostgreSQL database'
            'cockroachdb: CockroachDB database'
            'nginx: reverse-proxy')
makedepends=('go>=1.21' 'buf' 'yarn' 'dart-sass')
conflicts=('zitadel-bin')
license=('Apache License 2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zitadel/zitadel/archive/refs/tags/v${pkgver}.tar.gz"
        "zitadel.service"
        "zitadel.sysusers"
        "zitadel.tmpfiles"
        "config.yaml"
        "init.yaml")
sha512sums=('cee90f7d8429b91c4413583f8504388e41f46e45ec158429953a8bd109051870048aa4d45c255ca3e5da2fd3f56bf06881ee106000314a823c84ab0bef8ad8c1'
            '2d2a004537ff632daae1b9931764c1404495cf42ccf1bb96fbb7b6f47c0188b0f2da3e548fd7d90cebe5ab5045399729af3f1799564d11914df80dff244d10a5'
            'f497d8fdc43327a7bacc957b6c583a3dd81f3d1fe387869463cb23c5c0a8efcd04772f3fc528c528ebc6cb55d29e0d11ddf73bc7db7cf61655267b964bcc2f12'
            '7b847d89fb3d231d25a053b0a9a7fee2b184d17553b321fc403c86b122f349a65346a7e1522e1caa7e2c2dcef742358322e85ea1c2a0dd578e6e180a19553508'
            'c8beaaf1beecf3d8df7b1b8f6a954911d76e64dc26faabb8f58f5ef5029849f7297719814c898bb002eb21b36d3e7221d1ffcd47cec3d6b326c8e3e7d43dd5bf'
            '5595aac0f6154548dd79343da2c846dbd2fa723168992f16e57720812d463f76c4341b95571074e4e7ebd2da9c42d3b5a19fc189f5b397b0e9be721c857cfb09')
backup=('etc/zitadel/master.key'
        'etc/zitadel/config.yaml')
install="zitadel.install"

build() {
  cd "$pkgname-$pkgver"
  make compile
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/zitadel" "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/zitadel.service" "${pkgdir}/usr/lib/systemd/system/zitadel.service"
  install -Dm 644 "${srcdir}/zitadel.sysusers" "${pkgdir}/usr/lib/sysusers.d/zitadel.conf"
  install -Dm 644 "${srcdir}/zitadel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/zitadel.conf"
  install -Dm 644 "${srcdir}/config.yaml" "${pkgdir}/etc/zitadel/config.yaml"
  install -Dm 644 "${srcdir}/init.yaml" "${pkgdir}/etc/zitadel/init.yaml"
}
