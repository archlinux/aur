# Maintainer: silvermight <silver@silvermight.com>
pkgname=python-discord-git
pkgver=r1450.8ba7816
pkgrel=1
pkgdesc="Rewrite version of discord.py, an API wrapper for Discord"
arch=('any')
url="https://github.com/Rapptz/discord.py.git"
license=('MIT')
depends=('python' 'python-websockets' 'python-aiohttp')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
makedepends=('git')
source=("python-discord-git::git+https://github.com/Rapptz/discord.py.git#branch=rewrite")
provides=('python-discord')
conflicts=('python-discord')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/python-discord-git"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  python setup.py install --root="$pkgdir/" --optimize=1
}