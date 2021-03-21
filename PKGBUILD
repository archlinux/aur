# Maintainer: Jorge Araya Navarro <jorge@esavara.cr>
pkgname=goimapnotify
pkgver=2.1.1
pkgrel=1
pkgdesc="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
arch=('i686' 'x86_64')
url="https://gitlab.com/shackra/goimapnotify"
license=('GPL')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://gitlab.com/shackra/goimapnotify/-/archive/${pkgver}/goimapnotify-${pkgver}.zip")
sha256sums=('2d50a94a5ccd3f6e2e660c7867091886a17e33bc6c3946912df4b973a4de0fd3')

build() {
  cd "$pkgname-$pkgver"
  go build -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \-o ${pkgname} .
} 
 
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}/goimapnotify@.service" ${pkgdir}/usr/lib/systemd/user/goimapnotify@.service
}

# vim:set ts=2 sw=2 et:
