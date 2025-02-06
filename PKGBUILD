# Maintainer: chirsz <chirsz-ever#outlook.com>

_pkgname=qt6-base
pkgname=qt6-base-nogui
pkgver=6.8.2
pkgrel=1
arch=(x86_64)
provides=('qt6-base')
conflicts=('qt6-base')

url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Qt6 base without GUI components'
depends=(brotli
         double-conversion
         gcc-libs
         glib2
         glibc
         icu
         krb5
         libb2
         libproxy
         openssl
         pcre2
         systemd-libs
         zlib
         zstd)

_pkgfn=$_pkgname-$pkgver

source=("$_pkgfn.tar.zst::https://archlinux.org/packages/extra/x86_64/qt6-base/download/")
sha256sums=('cf9080e44716d74f49a2a3fa780624aaa50f4b7edb47e65752de36e65c863ec8')
noextract=($_pkgfn.tar.zst)

prepare() {
    mkdir -p $_pkgfn
    tar -xf $_pkgfn.tar.zst -C $_pkgfn
}

package() {
    mkdir -p $pkgdir/usr/lib
    for _component in Concurrent Core Network Sql Test Xml; do
        cp -a $_pkgfn/usr/lib/libQt6$_component.so* -t $pkgdir/usr/lib
    done
    for _plugin in networkinformation sqldrivers tls; do
        install -D $_pkgfn/usr/lib/qt6/plugins/$_plugin/*.so -t $pkgdir/usr/lib/qt6/plugins/$_plugin
    done
    install -D $_pkgfn/usr/share/licenses/$_pkgname/* -t $pkgdir/usr/share/licenses/$pkgname
}

