# Maintainer: wowario <wowario at protonmail dot com>
# Contributor: wowario <wowario at protonmail dot com>

pkgbase=('wownero-git')
pkgname=('wownero-git')
pkgver=v0.8.0.1.c70878b54e
pkgrel=1
pkgdesc="a fairly launched privacy-centric meme coin with no premine and a finite supply"
license=('custom:Cryptonote')
arch=('x86_64')
url="https://wownero.org/"
depends=('openssl' 'libpgm' 'unbound' 'libsodium')
makedepends=('git' 'cmake' 'boost')
provides=('wownero-git')

source=("${pkgname}"::"git+https://git.wownero.com/wownero/wownero")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  USE_SINGLE_BUILDDIR=1 make
}

package_wownero-git() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}/utils/conf/wownerod.conf" "${pkgdir}/etc/wownerod.conf"
  install -Dm644 "${srcdir}/${pkgname}/utils/systemd/wownerod.service" "${pkgdir}/usr/lib/systemd/system/wownerod.service"
  install -Dm755 "${srcdir}/${pkgname}/build/release/bin/wownerod" "${pkgdir}/usr/bin/wownerod"
  install -Dm755 "${srcdir}/${pkgname}/build/release/bin/wownero-wallet-cli" "${pkgdir}/usr/bin/wownero-wallet-cli"
  install -Dm755 "${srcdir}/${pkgname}/build/release/bin/wownero-wallet-rpc" "${pkgdir}/usr/bin/wownero-wallet-rpc"
}
