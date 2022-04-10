# Maintainer: mathieui <mathieui[at]mathieui.net>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=poezio
pkgver=0.14
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

sha256sums=('484d286190a66e79856533a51c428a2dada769b4d67e5ad471b0541dbdfb04c0')

build() {
    cd $pkgname-v$pkgver
    python setup.py build
    python setup.py build_man
    make doc
}

package() {
    cd $pkgname-v$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
