# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=triceratops
pkgname="${_pkgname}-lv2"
pkgver=0.3.2
pkgrel=1
pkgdesc="Polyphonic synthesizer LV2 plugin"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/triceratops/"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtkmm')
makedepends=('python2' 'lv2')
provides=("${_pkgname}.lv2")
source=("http://downloads.sourceforge.net/project/triceratops/${_pkgname}_${pkgver}.tar.gz")
noextract=("${_pkgname}_${pkgver}.tar.gz")
sha256sums=('8056b9e2dbfe3cd5b8e30eb28f5ce2a4f34e272c8bf5c897d02410b905fa91ed')

prepare() {
  cd "$srcdir"
  mkdir -p "${pkgname}-${pkgver}"
  tar -xzf "${_pkgname}_${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
