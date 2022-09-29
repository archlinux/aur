# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=needroleshere
pkgver=0.2.0
pkgrel=1
pkgdesc="Yet another AWS IAM Roles Anywhere helper"
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/needroleshere"
license=('Apache')
makedepends=('cargo')

backup=(
  'etc/default/needroleshere'
)

source=(
  "https://github.com/sorah/needroleshere/archive/v${pkgver}.tar.gz"
)

build() {
  cd "needroleshere-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "needroleshere-$pkgver"
  install -Dm0755 target/release/needroleshere "${pkgdir}/usr/bin/needroleshere"
  install -Dm0644 contrib/systemd/system/needroleshere.service "$pkgdir/usr/lib/systemd/system/needroleshere.service"
  install -Dm0644 contrib/systemd/system/needroleshere.socket "$pkgdir/usr/lib/systemd/system/needroleshere.socket"
  install -Dm0644 contrib/systemd/default/needroleshere "$pkgdir/etc/default/needroleshere"
}
sha512sums=('ae24ea594dcb1f734727ae973dd5db8e0f911fa2772601d4797f3c61337c46390211272ab94dfa9a036c0b26fc5c6f6e6186047572cab3966eca72c2dbe899ca')
