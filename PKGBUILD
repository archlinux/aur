# Maintainer: realroot

pkgname=tinydm
pkgver=1.2.0
pkgrel=1
pkgdesc="Tiny wayland / x11 session starter for single user machines"
arch=('any')
url="https://gitlab.com/postmarketOS/tinydm"
license=('GPL3')
makedepends=("make" "git")
depends=('xorg-xinit' 'autologin')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/postmarketOS/tinydm/-/archive/$pkgver/tinydm-$pkgver.tar.bz2")

prepare() {
  cd "$pkgname-$pkgver"
  # Remove logging setup, so logs go to stdout (and therefore to the log)
  sed -i 's@\(setup_log\)$@# \1@g' tinydm-run-session.sh
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=${pkgdir}/ install
  rm -r ${pkgdir}/etc/init.d
  rm -r ${pkgdir}/etc/conf.d
  install -Dm 644 ../../tinydm.sysusers ${pkgdir}/usr/lib/sysusers.d/tinydm.conf
}
sha256sums=('5539f3270a4890b5c7a73d05fcdc9a6eb832a86e02050111515f074bbcd3ae27')
