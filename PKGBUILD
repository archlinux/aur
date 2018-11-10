# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=tootstream
pkgver=0.3.6
pkgrel=1
pkgdesc="Text interface for the Mastodon social network"
arch=(any)
url="https://github.com/magicalraccoon/${pkgname}"
license=(MIT)
depends=(python-mastodon
	 python-humanize
	 python-click
	 python-colored
	 python-emoji)
makedepends=(python-distribute)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('07ca36cca8b901e2ad5d8cd44217b26f579a143b463b8d1caa6abc40df4d0396')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -ie 's/Mastodon.py==1\.3\.1/Mastodon.py/g' requirements.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ft=PKGBUILD sts=2 sw=2:
