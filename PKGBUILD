# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=howl-git
pkgver=0.6.r2.g9fe141e5
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=('i686' 'x86_64')
url='http://howl.io/'
license=('MIT')
depends=('gtk3' 'desktop-file-utils')
makedepends=('git' 'wget')
optdepends=('ruby: for running some scripts' 'coffee-script: for running some scripts')
provides=('howl')
conflicts=('howl')
source=(git+https://github.com/howl-editor/howl.git)
md5sums=('SKIP')

pkgver() {
  cd howl
  git describe --tags | sed "s+-+.r+" | tr - .
}

build() {
  cd howl/src
  make
}

package() {
  cd howl/src
  make PREFIX=/usr DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  rm "$pkgdir"/usr/share/howl/bundles/python/misc/examples.py
}
