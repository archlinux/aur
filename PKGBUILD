# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname="red-lavalink"
pkgname="python-$_pkgname"
pkgver=0.11.0
pkgrel=2
pkgdesc="Lavalink client library used in Red-DiscordBot"
url="https://github.com/Cog-Creators/Red-Lavalink"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'python-discord'
  'python-red-commons'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest-asyncio'
)

_pkgsrc="Red-Lavalink-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('9646a35433b51f953738f9e7e6faa5def753414740df8fb91f81271c1362b71a')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

_check() {
  cd "$_pkgsrc"
  PYTHONPATH=. pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
