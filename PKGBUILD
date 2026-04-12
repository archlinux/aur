# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Michał Lisowski <lisu@riseup.net>

pkgname=thunderbird-conversations
pkgver=4.3.9
pkgrel=1
pkgdesc="GMail-like conversation view for Thunderbird"
arch=('any')
url="https://github.com/thunderbird-conversations/thunderbird-conversations"
license=('MPL-2.0')
depends=('thunderbird')
makedepends=('npm' 'zip')
source=("https://github.com/protz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6ba12d0e49f84108bdbb5dedbdad6c00f39059851765648eb3fed2802687b48b')

check() {
  cd "${pkgname}-${pkgver}"
  npm test
}

build() {
  cd "${pkgname}-${pkgver}"
  npm ci
  npm run prod
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "conversations.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/gconversation@xulforum.org.xpi"
}
