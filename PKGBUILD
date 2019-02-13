# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=taskbook-git
pkgver=0.3.0
pkgrel=1
pkgdesc='Tasks, boards & notes for the command-line habitat (git)'
arch=(any)
url=https://github.com/klaussinani/taskbook
license=(MIT)
depends=(nodejs)
makedepends=(git npm)
provides=(taskbook)
conflicts=(taskbook)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd taskbook
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd taskbook
  npm install
}

package() {
  install -d "$pkgdir"/usr/{lib/node_modules,bin}
  cp -a taskbook "$pkgdir"/usr/lib/node_modules
  chmod +x "$pkgdir"/usr/lib/node_modules/taskbook/cli.js
  ln -s /usr/lib/node_modules/taskbook/cli.js "$pkgdir"/usr/bin/taskbook
  install -Dm 644 taskbook/license.md "$pkgdir"/usr/share/licenses/taskbook/LICENSE
}
