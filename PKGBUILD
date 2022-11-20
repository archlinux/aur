# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>

pkgname=python38-sphinx_rtd_theme
pkgver=1.0.0
pkgrel=5
pkgdesc='Read the Docs theme for Sphinx'
arch=('any')
url=https://github.com/readthedocs/sphinx_rtd_theme
license=('MIT')
depends=('python38-sphinx')
makedepends=('nodejs-lts-fermium' 'npm' 'python38-setuptools')
source=("$url/archive/$pkgver/sphinx_rtd_theme-$pkgver.tar.gz")
b2sums=('c70740d1f6b6afddd2b32b756e1f6940846459038d6ea0f03b218cfeb07e0974f4d186f9993eeddda58115d0b2a607e61b28081576b9f953d855f3cc3d51d836')

prepare() {
  cd sphinx_rtd_theme-$pkgver
  npm ci
}

build() {
  cd sphinx_rtd_theme-$pkgver
  npm run build
  python3.8 setup.py build
}

package() {
  cd sphinx_rtd_theme-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
