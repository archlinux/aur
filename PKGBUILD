# Maintainer: novenary <streetwalkermc@gmail.com>
pkgname=python-telethon-git
pkgver=1.6.2.r44.g34a8140f
pkgrel=1
pkgdesc="Pure Python 3 Telegram client library, asyncio version"
arch=('any')
url="https://github.com/LonamiWebs/Telethon/"
license=('MIT')
depends=('python' 'python-pyaes' 'python-rsa')
makedepends=('git' 'python-setuptools')
provides=('python-telethon')
conflicts=('python-telethon' 'python-telethon-aio-git')
options=(!emptydirs)
source=("git+https://github.com/LonamiWebs/Telethon.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/Telethon"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Telethon"
  ./setup.py build
}

package() {
  cd "$srcdir/Telethon"
  ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
