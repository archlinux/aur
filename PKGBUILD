# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Yamada Hayao <hayao@fascode.net>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
pkgname=xfce4-calculator-plugin
pkgver=0.7.2
pkgrel=1
pkgdesc="Simple command line based calculator for the Xfce panel"
arch=('i686' 'x86_64')
url="https://docs.xfce.org/panel-plugins/xfce4-calculator-plugin"
license=('GPL-2.0-or-later')
depends=('xfce4-panel')
makedepends=('intltool')
source=("https://archive.xfce.org/src/panel-plugins/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d1f622bea41a90c1686bf9f13c488ab28e995e2762b84712dea9027e0c94028b')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
