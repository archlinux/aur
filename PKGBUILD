# Maintainer: Marc Grondin <myself AT marcg DOT pizza>
# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=tootstream
pkgver=0.3.8.1
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
source=("requirements.txt.patch"
        "${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9ca9c83eada78ee42f011c6e3bd8e5b01caf770b1c3b152238a8e13ff26138d6'
            '69886966c98d6fdbf051958832f80c2b5364393796f42f011083ee25fc5ab7f8')

prepare() {
  patch ${pkgname}-${pkgver}/requirements.txt requirements.txt.patch
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
