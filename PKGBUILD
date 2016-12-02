# Maintainer: Øyvind 'Mr.Elendig' Heggstad  <mrelendig@har-ikkje.net>>
pkgname=kittypack-git
pkgver=0.2
pkgrel=1
pkgdesc="A silly little tool to get info from archlinux.org/packages"
arch=('any')
url="https://github.com/MrElendig/kittypack"
license=('AGPL3')
depends=('python' 'python-requests' 'python-docopt' 'python-yaml'
         'python-curtsies' 'python-setuptools')
makedepends=('git' 'python-docutils')
backup=('etc/kittypack.conf')
source=(git://github.com/MrElendig/kittypack.git)
sha1sums=('SKIP')

pkgver() {
  cd kittypack
  git describe | sed 's/-/./g'
}

build() {
  cd kittypack/doc/man
  rst2man kittypack.1.rst kittypack.1
}

package() {
  cd kittypack
  python3 setup.py install --root="$pkgdir"
  install -D doc/man/kittypack.1 "$pkgdir"/usr/share/man/man1/kittypack.1
  install -D kittypack/kittypack.conf "$pkgdir"/etc/kittypack.conf
}

# vim:set ts=2 sw=2 et:
