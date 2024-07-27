# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-nextcord-git
pkgver=4336.9785cb70
pkgrel=1
pkgdesc="A Python wrapper for the Discord API forked from discord.py "
arch=('any')
url="https://github.com/nextcord/nextcord"
license=('MIT')
depends=('python' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
makedepends=('git' 'python-wheel' 'python-build' 'python-installer')
source=("nextcord-git::git+https://github.com/nextcord/nextcord.git")
provides=('python-nextcord')
conflicts=('python-nextcord')
md5sums=('SKIP')

pkgver() {
  cd nextcord-git
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/nextcord-git"
python -m build
}

package() {
  cd "$srcdir/nextcord-git"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
