# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: Marc Grondin <myself AT marcg DOT pizza>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=tootstream
pkgver=0.4.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
         "0001-Fix-for-later-versions-of-colored.patch")
sha256sums=('ae30d2cec798d9b72eed378c5181c00cf3a5177ab09bb71fd6e4e20f9f860c93'
            'e2fe90e24b1ddcb6f20d7d6bbda2b89871188ae65317d6d0952f1c8fe3bc44ee')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -s < "${srcdir}/0001-Fix-for-later-versions-of-colored.patch"
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
