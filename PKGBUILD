# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: JulioJu  < juanes  0890  at google mail dot com >
# Contributor: Maks Verver <maksverver at geocities dot com>

pkgname=uml_utilities
pkgver=20070815
pkgrel=3
pkgdesc="User Mode Linux Utilities (Debian package uml-utilities). It contains uml_net, uml_mconsole, uml_switch, tunctl, … and the lib port-helper."
arch=(i686 x86_64)
depends=('fuse' 'perl')
provides=(
    'uml_utilities'
    'humfsify'
    'jail_uml'
    'jailtest'
    'tunctl'
    'uml_mconsole'
    'uml_mkcow'
    'uml_moo'
    'uml_mount'
    'uml_net'
    'uml_switch'
    'uml_watchdog'
    )
conflicts=(
    'uml_utilities'
    'humfsify'
    'jail_uml'
    'jailtest'
    'tunctl'
    'uml_mconsole'
    'uml_mkcow'
    'uml_moo'
    'uml_mount'
    'uml_net'
    'uml_switch'
    'uml_watchdog'
    )
url="http://user-mode-linux.sourceforge.net/"
source=(
    "http://user-mode-linux.sourceforge.net/${pkgname}_${pkgver}.tar.bz2"
    "uml_utilities.patch"
    )
license=('GPL2')
md5sums=(
    'b0468ac8b79cef53f36f5f9517907462'
    '8fbcca01953da90c48f5ec06f564480f'
    )
prepare() {
    cd "$srcdir/tools-$pkgver"
    patch -Np1 -i "${srcdir}/uml_utilities.patch"
}

build() {
    cd "$srcdir/tools-$pkgver"
    make
}

package() {
    cd "$srcdir/tools-$pkgver"
    make DESTDIR="$pkgdir" install
    mv "$pkgdir/usr/sbin/jail_uml" "$pkgdir/usr/bin/" && rmdir "$pkgdir/usr/sbin/" || return 4
    chown root "$pkgdir/usr/bin/"*
}
