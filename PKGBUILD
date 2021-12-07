# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-pytablewriter-altrow-theme
_pkgname="${pkgname#python-}"
pkgver=0.0.3
pkgrel=1
pkgdesc='pytablewriter plugin to provide a theme that colors rows alternatively'
arch=('any')
url='https://github.com/thombashi/pytablewriter-altrow-theme'
license=('MIT')
depends=('python-pytablewriter' 'python-tcolorpy')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytz' 'python-dateutil')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('3f24b65fb6cfc2b1fd170c8b0cf6ed74e7836d8a81cfd7aa5d0fe509be605b77'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py pytest
}

package() {
  export PYTHONHASHSEED=0
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
