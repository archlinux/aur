# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=castblock-git
_pkgname=castblock
_branch=main
pkgver=20.03c2c51
pkgrel=1
pkgdesc="CastBlock skips integrated youtube sponsors on all chromecasts on the network."
arch=('any')
url="https://github.com/erdnaxeli/castblock"
license=('MIT')
depends=('go-chromecast-git')
makedepends=('git' 'crystal' 'shards')
provides=('castblock')
conflicts=('castblock')
source=("$_pkgname::git+${url}.git#branch=$_branch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count "$_branch").$(git rev-parse --short "$_branch")
}

build() {
  cd "$srcdir/$_pkgname"
  shards build --release
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 ./bin/castblock "${pkgdir}/usr/bin/castblock"
  install -Dm644 contrib/castblock.service "$pkgdir"/usr/lib/systemd/system/castblock.service
}
