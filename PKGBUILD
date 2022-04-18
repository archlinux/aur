# Maintainer: Kiril Vladimiroff <kiril@vladimiroff.org>

pkgname=onlykey
pkgver=5.3.6
pkgrel=1
pkgdesc="OnlyKey Chrome Desktop App"
arch=('x86_64')
url="https://onlykey.io/"
license=('custom')
source=("https://github.com/trustcrypto/OnlyKey-App/releases/download/v${pkgver}/OnlyKey_${pkgver}_amd64.deb"
        "49-onlykey.rules")
sha256sums=('d5e223581b459c869a2f2d4c84cd77f52b851dced5c87dea5f8d93ec1cecc7c4'
            '6bb0a54748ec6ce1a1186b41f45a6bfc1363998c1a88722a8f1518c3278aabef')

package() {
  bsdtar -O -xf "OnlyKey_${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  find "${pkgdir}" -type d -exec chmod 755 {} +
  chmod 755 "${pkgdir}"/usr/share/applications/OnlyKey.desktop

  install -Dm 644 49-onlykey.rules "${pkgdir}/etc/udev/rules.d/49-onlykey.rules"
}
