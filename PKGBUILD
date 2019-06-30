# Maintainer: Leonardo Eugenio <lelgenio@disroot.org>
pkgname=mscs
pkgver=19.05.01.r0.ga4b7379
pkgrel=1
pkgdesc="Powerful command-line control for UNIX and Linux powered Minecraft servers"
arch=('any')
url="https://github.com/MinecraftServerControl/mscs"
license=('BSD')
depends=(
    screen
    perl-json
    perl-lwp-protocol-https 
    jre8-openjdk
    rdiff-backup
    rsync
    socat)
makedepends=(make git)
optdepends=(
    'python: Overviewer mapping tool'
    'iptables: Recommended firewall'
)
install=mscs.install
source=(
    "$pkgname::git+$url.git"
    "mscs.install"
    "mscs.patch")
md5sums=('SKIP'
         'acec91d1d7c9f0b99ab0ce877530ee4a'
         '815626b124df3779188ebb56427c7976')
pkgver(){
    cd $pkgname
    git describe --long --tags | sed 's/^v.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "$srcdir/mscs.patch"
}

package() {
    cd $srcdir/$pkgname
    make DESTDIR="$pkgdir/" install
}
