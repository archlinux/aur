# Contributor : Yamashita Ren
# Contributor : Ner0

pkgname=gpaste-daemon
pkgver=3.16.2.1
pkgrel=1
pkgdesc="A clipboard management daemon"
arch=('i686' 'x86_64')
url="http://www.imagination-land.org/tags/GPaste.html"
license=('GPL3')
depends=('gtk3' 'systemd' 'xcb-util-keysyms')
makedepends=('gobject-introspection' 'intltool')
conflicts=('cinnamon-extension-gpaste' 'gpaste')
provides=('gpaste')
options=('!emptydirs' '!libtool')
install=$pkgname.install
source=("http://www.imagination-land.org/files/gpaste/gpaste-$pkgver.tar.xz")
md5sums=('935b66abf61e1a0d6385acdbecbb8134')

build () {
  cd ${pkgname%-*}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
              --disable-applet --disable-gnome-shell-extension \
              --without-controlcenterdir --disable-schemas-compile --disable-vala
  make
}

package () {
  cd ${pkgname%-*}-${pkgver}
  make DESTDIR="$pkgdir/" install

  install -Dpm644 data/completions/gpaste "$pkgdir/etc/bash_completion.d/gpaste"
  install -Dpm644 data/completions/_gpaste "$pkgdir/usr/share/zsh/site-functions/_gpaste"
  rm -rf "$pkgdir/no"
}
