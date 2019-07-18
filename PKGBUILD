# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>

pkgname=python-sphinx_rtd_theme-git
pkgver=0.4.3.r22.gbad2112
pkgrel=1
pkgdesc='Read the Docs theme for Sphinx'
url=https://github.com/rtfd/sphinx_rtd_theme
arch=('any')
license=('MIT')
depends=('python-setuptools')
provides=('python-sphinx_rtd_theme')
conflicts=('python-sphinx_rtd_theme')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${url##*/}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${url##*/}
  ln -rsf fonts/{Lato,RobotoSlab} ${url##*/}/static/fonts
}

build() {
  cd ${url##*/}
  python setup.py build
}

package() {
  cd ${url##*/}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
