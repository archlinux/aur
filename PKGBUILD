# Maintainer: selpast <selpast@pm.me>
_pkgbase=mpv-discord
pkgname=$_pkgbase-git
pkgver=1.6.1.r0.g861bfe5
pkgrel=1
pkgdesc='A cross-platform Discord Rich Presence integration for mpv'
url='https://github.com/tnychn/mpv-discord'
arch=('any')
license=(MIT)
depends=(luajit)
source=(git+${url}.git)
sha256sums=(SKIP)
pkgver() {
    cd $_pkgbase
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/$_pkgbase/script-opts
    patch --forward --input="${srcdir}/../binary_path.patch"
}

package() {
    cd $srcdir/$_pkgbase
    mkdir -p $pkgdir/etc/mpv/scripts/
    mkdir -p $pkgdir/etc/mpv/script-opts/
    mkdir $pkgdir/lib/
    install -Dm644 "scripts/discord.lua" "${pkgdir}/etc/mpv/scripts/"
    install -Dm644 "script-opts/discord.conf" "${pkgdir}/etc/mpv/script-opts/"
    install -Dm644 "bin/linux/mpv-discord" "${pkgdir}/lib/"
}
