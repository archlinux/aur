# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=needroleshere
pkgver=0.3.0
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
  install -Dm0644 contrib/systemd/system/needroleshere-dir.service "$pkgdir/usr/lib/systemd/system/needroleshere-dir.service"
  install -Dm0644 contrib/systemd/system/needroleshere.socket "$pkgdir/usr/lib/systemd/system/needroleshere.socket"
  install -Dm0644 contrib/systemd/system/needroleshere-ecs-relative.socket "$pkgdir/usr/lib/systemd/system/needroleshere-ecs-relative.socket"
  install -Dm0644 contrib/systemd/default/needroleshere "$pkgdir/etc/default/needroleshere"
}
sha512sums=('e4c822de5a9037315831fdada6bc71c094928c777dd875e058c25e55a8e14b89ad019821cb5af6c8cc196f56cd805f369485224711427d5f815c4e379ea3f721')
