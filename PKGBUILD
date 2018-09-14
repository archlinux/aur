# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: SplitFire (split7fire at yandex.ru)

_pkgname=freelan
pkgname="$_pkgname"-git
pkgver=r3864.512f6799
pkgrel=1
pkgdesc="Peer-to-peer, secure, easy-to-setup, multi-platform, highly-configurable VPN software"
arch=('any')
url="https://github.com/freelan-developers/freelan"
license=('GPL')
depends=('boost' 'curl' 'miniupnpc' 'openssl')
makedepends=('git' 'help2man' 'scons')
source=(git+https://github.com/freelan-developers/"$_pkgname".git)
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    scons apps --mode=release
    # scons samples  # build fails currently
}

package() {
    cd "$srcdir/$_pkgname"
    scons install --mode=release prefix="$pkgdir" bin_prefix="$pkgdir"/usr
}
