# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Yamashita Ren
# Contributor: Ner0

pkgname=gpaste-daemon
pkgver=3.24.1
pkgrel=1
pkgdesc="A clipboard management daemon"
arch=('i686' 'x86_64')
url="http://www.imagination-land.org/tags/GPaste.html"
license=('GPL3')
depends=('systemd' 'xcb-util-keysyms' 'appstream-glib')
makedepends=('gobject-introspection' 'intltool')
conflicts=('cinnamon-extension-gpaste' 'gpaste')
provides=('gpaste')
options=('!emptydirs' '!libtool')
install=$pkgname.install
source=("http://www.imagination-land.org/files/gpaste/gpaste-$pkgver.tar.xz")
md5sums=('f26284590bb88ef10fa69e16658d67b5')

build () {
    cd ${pkgname%-*}-${pkgver}

    ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --disable-applet --disable-gnome-shell-extension --without-controlcenterdir --disable-schemas-compile --disable-vala
    make
}

package () {
    cd ${pkgname%-*}-${pkgver}
    make DESTDIR="$pkgdir/" install

    install -Dpm644 data/completions/gpaste-client "$pkgdir/etc/bash_completion.d/gpaste-client"
    install -Dpm644 data/completions/_gpaste-client "$pkgdir/usr/share/zsh/site-functions/_gpaste-client"
    rm -rf "$pkgdir/no"
}
