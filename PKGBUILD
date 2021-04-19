# Maintainer: Igor Saric <karabaja4 at gmail dot com>
# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

_pkgname=mimejs
pkgname=$_pkgname-git
pkgver=0.1.aa2c834
pkgrel=1
pkgdesc='A replacement for xdg-open written in Node.js'
arch=('i686' 'x86_64')
url="https://github.com/karabaja4/mimejs"
license=('MIT')
depends=('file' 'bash' 'nodejs')
makedepends=('npm')
provides=('xdg-utils')
conflicts=('xdg-utils')
source=('git+https://github.com/karabaja4/mimejs.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "0.1.$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  npm install
}

package() {
  cd $_pkgname
  mkdir -p "${pkgdir}/etc"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/mimejs"
  install -m 755 "main.js" "${pkgdir}/usr/lib/mimejs"
  cp -r "node_modules" "lib" "${pkgdir}/usr/lib/mimejs"
  ln -s "/usr/lib/mimejs/main.js" "${pkgdir}/usr/bin/xdg-open"
  install -m 644 "mime.json" "${pkgdir}/etc/mime.json"
}