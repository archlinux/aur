# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=python-telethon-git
pkgver=0.18.3.r48.g32b7e9e
pkgrel=1
pkgdesc="Pure Python 3 Telegram client library, asyncio version"
arch=('any')
url="https://github.com/LonamiWebs/Telethon/"
license=('MIT')
depends=('python>=3.5' 'python-pyaes' 'python-rsa' 'python-async_generator')
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
