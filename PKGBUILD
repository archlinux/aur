pkgname=onlykey
pkgver=5.1.0
pkgrel=1
pkgdesc="OnlyKey Chrome Desktop App"
arch=('x86_64')
url="https://onlykey.io/"
license=('custom')
source=("https://github.com/trustcrypto/OnlyKey-App/releases/download/v${pkgver}/OnlyKey_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/trustcrypto/trustcrypto.github.io/master/49-onlykey.rules")
sha256sums=('4638ce8b21c66b6f414d937d08ba01917db3d20b050630e6b456c338ba1c9e06'
            '23f3d18e8c5cd02823954f0065956b69e07bbdfeac95a04589beb33a154526c0')

package() {
  bsdtar -O -xf "OnlyKey_${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  find "${pkgdir}" -type d -exec chmod 755 {} +
  chmod 755 "${pkgdir}"/usr/share/applications/OnlyKey.desktop

  install -Dm 644 49-onlykey.rules "${pkgdir}/etc/udev/rules.d/49-onlykey.rules"
}
