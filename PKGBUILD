# Author: Dies <JerryCasiano(at)gmail(dot)com>
# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>

pkgname=font-manager
pkgver=0.7.5
pkgrel=3
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'sqlite' 'json-glib' 'gtk3')
optdepends=('file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala' 'meson' 'ninja')
source=("https://github.com/FontManager/master/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "vala-basefontlist.patch")
sha256sums=('9795212bdbf765e48662b2e8cb20bd232384c96f15a4c21dbc37643b2319cb30'
            'e35a497813a46b2b58118fc6fc6f137fd185131b333a71d2d2eebef9d61affef')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 < $srcdir/vala-basefontlist.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson --prefix /usr --buildtype=debugoptimized build_dir
    ninja -v -C build_dir
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build_dir install
}
