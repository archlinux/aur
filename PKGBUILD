# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=needroleshere
pkgver=0.4.0
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
  cargo build --release --locked --no-default-features --features rustls
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
sha512sums=('8913575519b5b77450a2284190342d6d03f29cc777e0ef20880c390838e6a371873a83f758b2898f7189fbd629738b8f210aaa1735b4e2d9a7153db056783bea')
