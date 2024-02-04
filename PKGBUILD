# Maintainer:  [none]
# Contributor: dreieck
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
_pkgname=tootstream
pkgname=tootstream-git
pkgver=0.4.0.r11.gf01781f
pkgrel=2
pkgdesc='Text interface for the Mastodon social network'
provides=(tootstream)
conflicts=(tootstream)
arch=('any')
url='https://github.com/magicalraccoon/tootstream'
license=(MIT)
depends=(python-mastodon
         python-humanize
         python-click
         python-colored
         python-emoji
         python-pytimeparse
         python-setuptools)
makedepends=(git)
source=("git+https://github.com/magicalraccoon/tootstream")
sha512sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/${_pkgname}"
  python ./setup.py build
}

package()
{
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
