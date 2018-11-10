# Maintainer: Daniel Moch <daniel@danielmoch.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
_pkgname=tootstream
pkgname=tootstream-git
pkgver=0.3.6.r7.gf2f8b8d
pkgrel=1
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
         python-http-ece)
makedepends=(python-setuptools git)
source=("git://github.com/magicalraccoon/${_pkgname}.git")
sha512sums=('SKIP')

prepare()
{
  cd "${srcdir}/${_pkgname}"
  sed -ie 's/\sasync=True/run_async=True/' src/tootstream/toot.py
  sed -ie 's/Mastodon.py==1\.3\.1/Mastodon.py/g' requirements.txt
}

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

# vim: ft=PKGBUILD sts=2 sw=2 et
