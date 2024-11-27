# Maintainer: Øyvind 'Mr.Elendig' Heggstad  <mrelendig@har-ikkje.net>>
pkgname=kittypack-git
pkgver=0.2.4
pkgrel=2
pkgdesc="A silly little tool to get info from archlinux.org/packages"
arch=('any')
url="https://github.com/MrElendig/kittypack"
license=('AGPL3')
depends=('python' 'python-requests' 'python-click' 'python-yaml' 'python-setuptools')
makedepends=('git' 'python-docutils' 'python-build' 'python-installer' 'python-wheel')
backup=('etc/kittypack.conf')
source=(git+https://github.com/MrElendig/kittypack.git)
sha1sums=('SKIP')

pkgver() {
  cd kittypack
  git describe | sed 's/-/./g'
}

build() {
  cd kittypack
  python -m build --wheel --no-isolation
  cd doc/man
  rst2man kittypack.1.rst kittypack.1

}

package() {
  cd kittypack
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D doc/man/kittypack.1 "$pkgdir"/usr/share/man/man1/kittypack.1
  install -D kittypack/kittypack.conf "$pkgdir"/etc/kittypack.conf
}

# vim:set ts=2 sw=2 et:
