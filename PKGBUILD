# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils-git
_project=quartz-utils
pkgver=0.0.2.r0.gad9a773
pkgrel=1
pkgdesc='Everyday CLI utilities that are easily pipable.'
arch=('x86_64' 'aarch64')
url='https://noraj.github.io/quartz-utils/'
license=('MIT')
depends=()
makedepends=('crystal' 'shards' 'git')
source=("git+https://github.com/noraj/$_project.git")
sha512sums=('SKIP')
b2sums=('SKIP')
provides=('quartz-utils')
conflicts=('quartz-utils-bin' 'quartz-utils')

pkgver() {
  cd $_project

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_project

  shards install --production
  shards build --production --release --no-debug
  strip bin/*
}

package() {
  cd $_project

  install -dm 755 "$pkgdir/usr/bin"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" docs/* *.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm 755 -t "$pkgdir/usr/bin" bin/*
}
