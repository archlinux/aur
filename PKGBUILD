# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello
pkgver=1.4.4
pkgrel=2
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('any')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
makedepends=('python-setuptools')
changelog=CHANGELOG
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c42d5202282fa10b57f5830b8e4a74da7a75d585f000b812bbfd90bff28c2bfc')

prepare() {
  cd "$pkgname-$pkgver"
  ## remove manpage from setuptools installation to install it manually
  mv jello/man ./
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 man/jello.1 -t "$pkgdir/usr/share/man/man1/"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
