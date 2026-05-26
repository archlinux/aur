pkgname=nusgmon-git
pkgdesc="Record, log, and analyze your internet usage (systemd-service)"
depends=('python' 'python-psutil' 'systemd')
makedepends=('git')
pkgver=95
pkgrel=1
arch=('any')
source=('git+https://github.com/LUCKYS1NGHH/nusgmon.git')
license=('GPL-3.0')
url="https://github.com/LUCKYS1NGHH/nusgmon"
sha256sums=('SKIP')

pkgver() {
  cd nusgmon
  git rev-list --count HEAD
}

package() {
  install -Dm755 "$srcdir/nusgmon/nusgmon" "$pkgdir/usr/bin/nusgmon"
  install -Dm644 "$srcdir/nusgmon/nusgmon.service" "$pkgdir/etc/systemd/user/nusgmon.service"

  sed -i "s|^ExecStart=.*|ExecStart=/usr/bin/nusgmon record -w 3|" "$pkgdir/etc/systemd/user/nusgmon.service"
  grep -v "Requires=network.target" "$srcdir/nusgmon/nusgmon.service" > "$pkgdir/etc/systemd/user/nusgmon.service"
}

install=nusgmon.install
