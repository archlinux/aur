# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: 謝致邦<Yeking@Red54.com>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=gnome-system-tools
pkgver=3.0.0
pkgrel=6
pkgdesc='Cross-platform configuration utilities for GNOME'
arch=('i686' 'x86_64' 'armv7h')
url='https://en.wikipedia.org/wiki/GNOME_System_Tools'
license=('GPL-2.0')
options=('!libtool')
depends=('wireless_tools' 'liboobs' 'polkit-gnome' 'libnautilus-extension' 'dconf')
makedepends=('gnome-doc-utils' 'intltool')
install=gnome-system-tools.install
source=("ftp://ftp.gnome.org/pub/gnome/sources/${pkgname}/3.0/${pkgname}-${pkgver}.tar.bz2"
        'po.patch'
        'gnome-system-tools.install')
sha256sums=('905df26c02f00a6c2c18706ba3db7eab764e3df6576289e103504aa39a47ae0b'
            '827c3169ae5060403b3f833b0f9c1d5cefe1d80aa5ade22e2ff7908b1ce1b5ef'
            '6b32aca3f8f3aceb2b904da231bdfdbc5ff2c023047b60eee95fb45b8fd73754')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/po.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr  --sysconfdir=/etc \
        --localstatedir=/var --disable-scrollkeeper --disable-static \
        --disable-services --disable-schemas-compile LIBS="-lm -lgthread-2.0"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}