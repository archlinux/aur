# Maintainer: Øyvind 'Mr.Elendig' Heggstad  <mrelendig@har-ikkje.net>>
pkgname=kittypack-git
pkgver=20150321.19
pkgrel=1
pkgdesc="A silly little tool to get info from archlinux.org/packages"
arch=('any')
url="https://github.com/MrElendig/kittypack"
license=('AGPL3')
depends=('python' 'python-requests' 'python-docopt' 'python-yaml'
         'python-curtsies')
makedepends=('git' 'python-docutils')
backup=('etc/kittypack.conf')
source=(git://github.com/MrElendig/kittypack.git)
sha1sums=('SKIP')

pkgver() {
  cd kittypack
  _d=$(git log -n 1 --pretty=%ad --date=short | sed 's/-//g')
  _c=$(git log --pretty=%h | wc -l)
  printf '%s.%s' $_d $_c
}

build() {
  cd kittypack/doc/man
  rst2man kittypack.1.rst kittypack.1
}

package() {
  cd kittypack
  python3 setup.py install --root="$pkgdir"
  install -D doc/man/kittypack.1 "$pkgdir"/usr/share/man/man1/kittypack.1
}

# vim:set ts=2 sw=2 et:
