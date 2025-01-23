# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wordpress-git
pkgver=6.7.1.r293.g4a991830e2
pkgrel=1
pkgdesc="Blog tool, publishing platform and CMS"
arch=('any')
url="https://wordpress.org/"
license=('GPL-2.0-or-later')
depends=('php')
makedepends=('git')
optdepends=('apache: Web server for serving WordPress'
            'mariadb: Database server'
            'nginx: Web server for serving WordPress')
provides=("wordpress=$pkgver")
conflicts=('wordpress')
install=wordpress.install
source=("git+https://github.com/WordPress/wordpress-develop")
sha256sums=('SKIP')


pkgver() {
  cd "wordpress-develop"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

package() {
  cd "wordpress-develop"

  install -d "$pkgdir/usr/share/webapps/wordpress"
  cp -r "src"/* "$pkgdir/usr/share/webapps/wordpress"
}
