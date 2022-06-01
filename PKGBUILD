# Contributor: silvermight <silver@silvermight.com>
pkgname=python-discord-git
pkgver=r4318.823d650e
pkgrel=1
pkgdesc="A modern, easy to use, feature-rich, and async ready API wrapper for Discord"
arch=('any')
url="https://github.com/Rapptz/discord.py"
license=('MIT')
depends=('python' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
makedepends=('git')
source=("python-discord-git::git+https://github.com/Rapptz/discord.py.git")
provides=('python-discord')
conflicts=('python-discord')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/python-discord-git"
  python setup.py build
}

package() {
  cd "$srcdir/python-discord-git"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
