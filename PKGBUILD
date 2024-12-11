# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-webruntime
pkgver=0.5.8
pkgrel=4
pkgdesc='Launch HTML5 apps in the browser or a desktop-like runtime.'
arch=('any')
url='https://github.com/flexxui/webruntime'
license=('BSD')
depends=('python-dialite')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08e4ea844e544b28433c35bd485cecaa672d60b5206877f7b4bb49d537fd248c')

build() {
  cd "webruntime-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "webruntime-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/webruntime-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
