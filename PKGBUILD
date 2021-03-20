# Maintainer: Jorge Araya Navarro <jorge@esavara.cr>
pkgname=goimapnotify
pkgver=2.1
pkgrel=1
pkgdesc="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
arch=('i686' 'x86_64')
url="https://gitlab.com/shackra/goimapnotify"
license=('GPL')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://gitlab.com/shackra/goimapnotify/-/archive/${pkgver}/goimapnotify-${pkgver}.zip"
        "goimapnotify@.service")
sha256sums=('cb2cf936fa1e9697d49aa4ea88363d119df33c0996a037be902db030255e2c09'
            'fad87eddc39f8ba2f7637024de96238cd9d5b0a7ce271ce75062127be74c1d0b')

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
  install -D -m0644 ${srcdir}/goimapnotify@.service ${pkgdir}/usr/lib/systemd/user/goimapnotify@.service
}

# vim:set ts=2 sw=2 et:
