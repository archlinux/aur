# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.15.1
pkgrel=1
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('GPL-3.0-or-later')
depends=('python' 'python-slixmpp' 'python-setuptools')
makedepends=('python-sphinx')
source=("https://codeberg.org/poezio/poezio/archive/v${pkgver}.tar.gz")
optdepends=('poezio-omemo: OMEMO plugin'
            'python-aiohttp: file upload'
            'python-pyinotify: Autoaway with screen plugin (also works with tmux)'
            'figlet: ASCII art plugin')

sha256sums=('d2919b76f3ee7f53ce871c795e91a749ca2fafbf77aeed8f0b9e5cc5f5bcae63')
build() {
    cd "$pkgname"
    rm -f dist/*.whel
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
