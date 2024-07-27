# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-disnake-git
pkgver=4684.9383d15ff
pkgrel=1
pkgdesc="An API wrapper for Discord written in Python. "
arch=('any')
url="https://github.com/DisnakeDev/disnake"
license=('MIT')
depends=('python' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
makedepends=('git' 'python-wheel' 'python-build' 'python-installer')
source=("disnake-git::git+https://github.com/DisnakeDev/disnake")
provides=('python-disnake')
conflicts=('python-disnake')
md5sums=('SKIP')

pkgver() {
  cd disnake-git
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  pwd
  cd "$srcdir/disnake-git"
python -m build
}

package() {
  cd "$srcdir/disnake-git"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
md5sums=('SKIP')
