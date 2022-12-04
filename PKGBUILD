# Maintainer: xsmile <>

pkgname=chromexup
pkgver=0.5.2
pkgrel=1
pkgdesc='External extension updater for Chromium based browsers'
arch=(any)
url=https://github.com/xsmile/chromexup
license=(MIT)
makedepends=(python-setuptools)
depends=(python-requests)
install="$pkgname.install"
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('36035b9d7b351d2091e07491dec2be249f62d066c4e509b04da897b7d94821ff')

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
