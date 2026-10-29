# Maintainer: Emiel Kollof <emiel@kollof.nl>
pkgname=xepher
pkgver=1.1.0
pkgrel=1
pkgdesc="Xepher — WeeChat plugin for XMPP/Jabber protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/ekollof/xepher"
license=('MPL2')
depends=(
    'weechat>=4.3'
    'libstrophe'
    'libxml2'
    'lmdb'
    'libsignal-protocol-c'
    'libomemo-c'
    'gpgme'
    'fmt'
    'curl'
    'openssl'
)
makedepends=(
    'clang'
    'cmake'
    'ninja'
    'git'
    'bison'
    'flex'
)
source=("git+https://github.com/ekollof/xepher.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/xepher"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/xepher"
    make PACKAGE_BUILD=1 weechat-xmpp
}

package() {
    cd "$srcdir/xepher"
    install -Dm755 xmpp.so "$pkgdir/usr/lib/weechat/plugins/xmpp.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
