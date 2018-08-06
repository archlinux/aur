# Maintainer: Daniel Moch <daniel@danielmoch.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
_pkgname=tootstream
pkgname=tootstream-git
pkgver=0.3.4.r3.gfef1e72
pkgrel=4
pkgdesc='Text interface for the Mastodon social network'
provides=('tootstream')
conflicts=('tootstream')
arch=('any')
url='https://github.com/magicalraccoon/tootstream'
license=('MIT')
depends=(
  'python-mastodon'
  'python-humanize'
  'python-click'
  'python-colored'
  'python-emoji'
  'python-http-ece'
  )
makedepends=('python-distribute' 'git')
source=("git://github.com/magicalraccoon/${_pkgname}.git")
sha512sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/${_pkgname}"
  sed -i 's/async=True/run_async=True/' src/tootstream/toot.py
  python ./setup.py build
}

package()
{
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=PKGBUILD sts=2 sw=2 et
