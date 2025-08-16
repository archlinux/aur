# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=firefox-debugadapter
pkgver=2.15.0
pkgrel=1
pkgdesc='Debug Adapter for Firefox'
arch=(any)
url='https://www.npmjs.com/package/firefox-debugadapter'
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('c33d868ebeedc7504b8bab3b8d38cf1a782ef43ed3fe3ff3d3a1b329575642c12e6c0e6e3e6aaf73bae433187cf4ef16b53f2cfa0b79387fcb48f60ed3463af3')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/firefox-debugadapter" <<'EOF'
#!/usr/bin/sh

exec node /usr/lib/node_modules/firefox-debugadapter/adapter.bundle.js "$@"
EOF
}
