# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: by Eric Viveiros <eviveiro at gmail dot com>

_pkgname=xfce-polkit
pkgname=${_pkgname}-git
pkgver=17.6ad1ee8
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for XFCE'
arch=('x86_64' 'i686')
url="https://github.com/ncopa/xfce-polkit"
license=(GPL)
depends=('polkit' 'libxfce4ui')
makedepends=('git')
provides=("${_pkgname}" "polkit-gnome")
conflicts=("${_pkgname}" "polkit-gnome")
source=(git+$url
        xfce-polkit.desktop)
md5sums=('SKIP'
         '7f0d7f7583351851be1bf4c1665fdf91')
install=xfce-polkit.install

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() { 
  cd "$srcdir/$_pkgname"
  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  install -Dm755 "$srcdir/$_pkgname/src/xfce-polkit" \
    "$pkgdir/usr/lib/$_pkgname/xfce-polkit"
  install -Dm644 "$srcdir/xfce-polkit.desktop" \
    "$pkgdir/etc/xdg/autostart/xfce-polkit.desktop"
}

# vim:set ts=2 sw=2 et:
