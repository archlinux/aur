# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Original maintainer: Johnathan Jenkins twodopeshaggy@gmail.com
# Contributor: Mark Cornick <mcornick@mcornick.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>

_pkgname=z
pkgname=z-git
pkgver=1.11.23.gb82ac78
pkgrel=1
pkgdesc="z keeps track of where you've been and provides a convenient \
way to jump to directory that you actually use (git version)"
url="https://github.com/rupa/z"
arch=('any')
license=('WTFPL')
depends=('sh')
provides=('z')
conflicts=('z')
install=z-git.install
makedepends=('git')
source=(git+https://github.com/rupa/z)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

package() {
  cd $_pkgname

  # update path in manpage
  sed -i z.1 -e "s:/path/to/z.sh:/usr/share/z/z.sh:g"
  install -Dm 644 z.1    "$pkgdir/usr/share/man/man1/z.1"
  install -Dm 644 z.sh   "$pkgdir/usr/share/z/z.sh"
}
