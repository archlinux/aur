# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=tootstream
pkgver=0.3.7
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
sha256sums=('292ad86462c9203bf1923b684b5342f6885652ce2033f5a0bb14749bfff4db6f'
            'dc2f0244078ee1fdcf80955533a7d83b1a1fb693692bf5b6080f1313948b6adb')

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
