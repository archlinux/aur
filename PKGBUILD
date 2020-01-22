# Maintainer: Milk Brewster - milkii on Freenode
_pkgname=sacad
pkgver=2.1.8.r5.g835fe12
pkgname=${_pkgname}-git
pkgrel=1
pkgdesc="Smart Automatic Cover Art Downloader"
arch=('any')
url="https://github.com/desbma/${_pkgname}"
license=('MPL2')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-appdirs' 'python-bitarray' 'python-cssselect' 'python-lxml' 'python-mutagen' 'python-pillow' 'python-tqdm' 'python-fake-useragent')
makedepends=('python-pip')
provides=('sacad' 'sacad-git')
conflicts=('sacad' 'sacad-git')
source=("git+https://github.com/desbma/${_pkgname}")
md5sums=( 'SKIP' )

pkgver() {
  cd "$scrdir"
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/${_pkgname}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps web_cache
    python setup.py install --root="${pkgdir}"
}
