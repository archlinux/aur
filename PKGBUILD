# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=steam-cli
pkgname=$_pkgname-git
pkgver=0.r55.9bbea6c
pkgrel=1
pkgdesc=''
arch=('any')
url='https://github.com/berenm/steam-cli'
license=('Unlicense')
depends=('python' 'python-pexpect' 'python-vdf' 'python-xdg' 'python-docopt'
         'python-requests' 'python-dateutil' 'python-aiohttp' 'python-plyvel')
makedepends=('git')
optdepends=('steam')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=python")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$_pkgname/README.rst"
  install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$_pkgname/UNLICENSE"
}
