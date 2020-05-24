# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.13
pkgrel=1
pkgdesc="A full-featured command-line IRC-like XMPP (Jabber) client"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://poez.io"
license=('zlib')
depends=('python' 'python-slixmpp')
makedepends=('python-setuptools' 'python-sphinx')
source=("https://lab.louiz.org/poezio/poezio/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
optdepends=('poezio-omemo: OMEMO plugin'
            'python-potr-git: OTR plugin'
            'python-pyinotify: Autoaway with screen plugin (also works with tmux)'
            'figlet: ASCII art plugin')

sha256sums=('ebe8fcdd8887d97098b3ce5e9682229ed96c21e8663a17475c4674764c3819d4')

build() {
    cd $pkgname-v$pkgver
    python setup.py build
    make doc
}

package() {
    cd $pkgname-v$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
