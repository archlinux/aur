# Maintainer: Igor Saric <karabaja4 at gmail dot com>

_pkgname=mimejs
pkgname=$_pkgname-git
pkgver=0.1.2a3d118
pkgrel=1
pkgdesc='A replacement for xdg-open written in Node.js'
arch=('i686' 'x86_64')
url="https://github.com/karabaja4/mimejs"
license=('MIT')
depends=('file' 'bash')
makedepends=('nodejs-lts-fermium' 'npm')
provides=('xdg-utils')
conflicts=('xdg-utils')
source=('git+https://github.com/karabaja4/mimejs.git')
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd $_pkgname
  echo "0.1.$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  npm install
  node_modules/pkg/lib-es5/bin.js --targets linux main.js
}

package() {
  cd $_pkgname
  install -Dm755 "main" "${pkgdir}/usr/bin/xdg-open"
  install -Dm644 "mime.json" "${pkgdir}/etc/mime.json"
}