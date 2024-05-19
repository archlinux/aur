# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=wipemychat
pkgver=1.1.0
pkgrel=2
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=('any')
url="https://github.com/rusq/wipemychat"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go' 'goreleaser' 'delve' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8ac2bd483fc212a951474e6da46216136486c8fe6d8bb1cb7c237ea69502a3c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="-L/usr/local/opt/openssl/lib"
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "tgmsgdel" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
