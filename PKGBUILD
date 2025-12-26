# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander Minges <alexander.minges@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Andrzej Wąsowski <wasowski@data.pl>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>
# Contributor: Vo Van Hong Ngoc <vhngoc@ubuntu-vn.org>

pkgname=rawdog
pkgver=3.0rc0.r13.gdd10021
pkgrel=1
pkgdesc='RSS Aggregator Without Delusions Of Grandeur'
arch=(any)
url='https://github.com/echarlie/rawdog-py3'
license=(GPL-2.0-or-later)
depends=(
  python
  python-feedparser
  python-tidylib
)
makedepends=(
  git
  python-setuptools
  python-build
  python-installer
  python-wheel
)
install=rawdog.install
source=("$pkgname::git+$url#commit=dd10021207122a7214577353c6565641bbc6b1b5")
sha512sums=('ba0a6b411ffcb342b21666452654f046fe5e417fbb44ca112d94febe566dabbb6ad367617b8b344ff35cf9966eebd0e855dd1083e0df11529f9b90634d6c6ac9')
b2sums=('6e5f527570e43890900175d7b675a5d204410eb151ce9e72edf0bacfb1b592f57a075a9e197a2bcd2a746a9ee2d78e57462c20ed42a06d4d53a7d2dd8ada6d79')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md config style.css
}
