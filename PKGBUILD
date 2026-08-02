pkgname=nusgmon-git
pkgdesc="Lightweight CLI to record and analyze network usage per interface"
depends=('python' 'python-psutil' 'systemd')
makedepends=('git')
pkgver=121
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
  install -Dm755 "$srcdir/nusgmon/nusgmon" "$pkgdir/usr/local/bin/nusgmon"
  install -Dm644 "$srcdir/nusgmon/nusgmon.service" "$pkgdir/etc/systemd/system/nusgmon.service"

  grep -v "Requires=network.target" "$srcdir/nusgmon/nusgmon.service" > "$pkgdir/etc/systemd/system/nusgmon.service"
  sed -i "s|^ExecStart=.*|ExecStart=/usr/local/bin/nusgmon record -w 3|" "$pkgdir/etc/systemd/system/nusgmon.service"
}

install=nusgmon.install
