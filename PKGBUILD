# Maintainer Sergii Fesenko
# Contributor: das_kube

pkgname='esy'
pkgver='0.7.2'
arch=('i686' 'x86_64')
pkgrel='1'
pkgdesc="package manager for OCaml/Reason"
url="https://esy.sh/"
license=('BSD-2-Clause')
depends=()
makedepends=('npm>=6.9')

# pkgver() {
#   npm view $pkgname version
# }

build() {
  mkdir -p snapshot && cd snapshot/

  npm init -y > /dev/null 2> /dev/null
  npm install "esy@${pkgver}" --no-scripts
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/esy/"

  tar -xf snapshot/node_modules/esy/platform-linux/_export/esy-*.tar.gz --strip-components=1 -C $pkgdir/opt/esy/
  install -Dm 644 snapshot/node_modules/esy/LICENSE $pkgdir/usr/share/licenses/esy/LICENSE
  ln -s /opt/esy/bin/esy $pkgdir/usr/bin/esy

  find $pkgdir -type d -empty -delete
}

