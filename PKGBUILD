# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=paperback-cli-git
_pkgname=paperback-cli
pkgver=r128.429f365
pkgrel=1
pkgdesc="Relatively high density file backups on paper (git version)"
url="https://github.com/Wikinaut/paperback-cli"
depends=('glibc')
makedepends=('git')
license=('GPL')
arch=('x86_64' 'i686')
source=("${_pkgname}"::'git+https://github.com/Wikinaut/paperback-cli.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  git submodule update --init --recursive
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm755 paperback-cli $pkgdir/usr/bin/paperback-cli
  install -Dm755 README.md $pkgdir/usr/share/doc/paperback-cli/README.md
}

# vim:set ts=2 sw=2 et:
