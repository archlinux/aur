# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=firefox-debugadapter
pkgver=2.13.0
pkgrel=1
pkgdesc='Debug Adapter for Firefox'
arch=(any)
url='https://www.npmjs.com/package/firefox-debugadapter'
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('11e0532d0ae46d25713a643f48356ce7abcb82addec1d16dd2c6521416811e03d1f234beaef1547ac437bb3c1ea131ac4427ee236566c47c13260a5e6f22600f')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/firefox-debugadapter" <<'EOF'
#!/usr/bin/sh

exec node /usr/lib/node_modules/firefox-debugadapter/adapter.bundle.js "$@"
EOF
}
