# Maintainer: xsmile <>

pkgname=chromexup
pkgver=0.5.1
pkgrel=4
pkgdesc='External extension updater for Chromium based browsers'
arch=(any)
url=https://github.com/xsmile/chromexup
license=(MIT)
makedepends=(python-setuptools)
depends=(python-requests)
install="$pkgname.install"
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('aa8253209d0be8aab4879f97f3b187b990ee4348aa6e53e7ccbdc1fac3c734a5')

package() {
  cd $pkgname-$pkgver

  # Configuration template
  install -Dm644 config.ini.example -t "$pkgdir"/usr/share/$pkgname/
  # Systemd scripts
  install -Dm644 scripts/systemd/$pkgname.service      -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 scripts/systemd/$pkgname-daily.timer  -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 scripts/systemd/$pkgname-weekly.timer -t "$pkgdir"/usr/lib/systemd/user/
  # License
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  python setup.py install --root="$pkgdir" --optimize=1
}
