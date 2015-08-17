# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# based on Johannes Schriewer <jschriewer@gmail.com> package
# G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

pkgname=sooperlooper
pkgver=1.7.0
pkgrel=2
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL')
depends=('jack' 'liblo' 'wxgtk2.8' 'libsigcpp1.2' 'rubberband')
install="$pkgname.install"
source=("$url$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "slgui.png")
md5sums=('ce1111ab22e5e8947632101d920ce500'
         '32fb17517f5f67931334f735eec826d9'
         '72e5581061403c022c1305e8b717e9d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --with-wxconfig-path=/usr/bin/wx-config-2.8
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../slgui.png \
    "$pkgdir/usr/share/pixmaps/slgui.png"
}
