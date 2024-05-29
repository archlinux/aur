# Maintainer: Thomas Schneider <thomas.aur@brainfuck.space>
pkgname=opengist-bin
_pkgname=opengist
pkgver=1.7.2
pkgrel=1
pkgdesc="Opengist Server"
arch=('x86_64')
url="https://github.com/thomiceli/opengist"
license=('MIT')
optdepends=('nginx')

if [ "$CARCH" == 'x86_64' ]; then
    _arch='amd64'
else
    _arch="$CARCH"
fi

source=(
    "https://github.com/thomiceli/opengist/releases/download/v$pkgver/opengist$pkgver-linux-${_arch}.tar.gz"
    "opengist.service"
    "sysusers.conf"
    "tmpfiles.conf"
)

package() {
    cd "$srcdir"
    tar xzvf opengist$pkgver-linux-$_arch.tar.gz
    install -Dm755 opengist/opengist "$pkgdir/usr/bin/opengist"
    
    # Create directories and config file
    install -d -m755 "$pkgdir/etc/$_pkgname"
    install -m644 ${srcdir}/opengist/config.yml "$pkgdir/etc/$_pkgname/config.yml"

    # Install service file
    install -Dm644 opengist.service "$pkgdir/usr/lib/systemd/system/opengist.service"

    # Install sysusers.conf and tmpfiles.conf
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
sha256sums=('3c581df49019b54f616e7132996a950a8c27b2d0b9504322d411a56b8003c25f'
            '9e1e296ae4106c6b1f4d91a7c570d540624791c5666d42e4dfe83ccb6f5784dc'
            '5c6642f718fdf5f4550fc9c63d5b0d3e862a34c8b2a7a72652b119dccd4862bb'
            '8742a60b809d23af4606ecad3140168fd5a79fac983a9b31c97253c3078d0326')
