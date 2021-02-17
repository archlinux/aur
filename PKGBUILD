# Maintainer: Evgeniy <genues@gmail.com>
pkgname=opensmtpd-filter-replace-from_reply
pkgver=1.0.1
pkgrel=1
pkgdesc='This is a simple OpenSMTPD filter for overwriting the email address in the MAIL FROM command, in the header in all sent messages, as well as for substituting the original MAIL FROM address in the Reply-To field'
license=("MIT")
arch=(i686 x86_64)
depends=(glibc)
makedepends=(go)
source=('https://github.com/Genues/opensmtpd-filter-replace-from_reply/archive/main.zip')
sha512sums=('SKIP')

build() {
cd "$pkgname"-main
go build -buildmode pie -ldflags "-extldflags $LDFLAGS" -trimpath "$pkgname.go"
}

package() {
cd "$pkgname"-main

install -D "$pkgname" -t "$pkgdir"/usr/lib/smtpd/opensmtpd
install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}