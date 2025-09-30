# Maintainer: Thomas Schneider <thomas.aur@brainfuck.space>
pkgname=opengist-bin
_pkgname=opengist
pkgver=1.11.1
pkgrel=0
pkgdesc="Opengist Server"
arch=('x86_64')
url="https://github.com/thomiceli/opengist"
license=('MIT')
optdepends=('nginx')
backup=("etc/$_pkgname/config.yml")

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
sha256sums=('ea4c0fdfa14ccc66e0608ef2afb78606a40a7cd0627cbe2b66c2653e184762f8'
            '9e1e296ae4106c6b1f4d91a7c570d540624791c5666d42e4dfe83ccb6f5784dc'
            '05493c53b97bfa288d37018004009b9567a1b0253e3f1bab0a0390eee1028a98'
            '18db5c2f8db7e2e4961a97527431eaaabfffda4e2a3364a13dd6f1ddcf4091c1')
