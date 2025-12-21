# Maintainer: Flaviu Tamas <me at flaviutamas dot com>
# Contributor: Librewish <librewish AT gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nohang
pkgver=0.3.0
pkgrel=1
pkgdesc="A sophisticated low memory handler."
arch=('any')
url="https://github.com/hakavlad/nohang"
license=('MIT')
depends=('python' 'systemd')
makedepends=('git')
optdepends=('libnotify: notification server'
  'logrotate: logrotate support'
  'sudo: if nohang started with UID=0')
backup=("etc/$pkgname/$pkgname.conf"
  "etc/$pkgname/$pkgname-desktop.conf"
  "etc/logrotate.d/$pkgname")
source=("https://github.com/hakavlad/nohang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6415b1ffcc6f9d811ce8b1cc827a551c344c9d15f55831440183d0a0210ed1d5')

package() {
  cd "$srcdir/$pkgname"
  make \
    DESTDIR="$pkgdir" \
    PREFIX='/usr' \
    SBINDIR='/usr/bin' \
    SYSCONFDIR='/etc' \
    SYSTEMDUNITDIR='/usr/lib/systemd/system' \
    base units

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
