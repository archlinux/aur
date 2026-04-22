# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.17
pkgrel=1
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('GPL-3.0-or-later')
depends=('python' 'python-slixmpp' 'python-setuptools')
makedepends=('python-sphinx')
source=("https://codeberg.org/poezio/poezio/archive/v${pkgver}.tar.gz")
optdepends=('poezio-omemo: OMEMO plugin'
            'python-emoji: message reactions'
            'python-aiohttp: file upload'
            'python-pyinotify: Autoaway with screen plugin (also works with tmux)'
            'figlet: ASCII art plugin')

sha256sums=('fa690ad8158c27839cb881c0b6163e42d2ba5643ba23751c7edf55935e17fa03')
build() {
    cd "$pkgname"
    rm -f dist/*.whl
    sphinx-build -b man doc/source build/sphinx/man
    sphinx-build doc/source build/sphinx/html
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
