# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>
pkgname=python-croniter
_name=${pkgname#python-}
pkgver=6.0.0
pkgrel=2
pkgdesc="Parses cron schedules to iterate over datetime objects."
arch=('any')
url="https://github.com/pallets-eco/croniter"
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-pytz'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("https://github.com/pallets-eco/croniter/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5b13012a70272e484f4644669ddae75e84a5597c41b44a5f628337e7c6acf329')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest src
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
