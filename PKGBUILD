# Maintainer: Ayush Shenoy <ayush.shenoy92@gmail.com>
# Past maintainers: 
#     * Jens John <asterisk@2ion.de>
#     * Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributors:
#     * Alireza Savand <alireza.savand@gmail.com>
#     * Maxime de Roucy <maxime.deroucy@gmail.com>
#     * Xyne <ac xunilhcra enyx, backwards>
#     * speeddefrost
#     * stefanr
#     * Bjorn Neergaard <bjorn@neersighted.com>

pkgname=alsaequal
pkgver=v0.7.1
pkgrel=1

pkgdesc='Real-time adjustable equalizer plugin for ALSA sound server'
url='https://github.com/bassdr/alsaequal'
license=('GPL2')
arch=('i686' 'x86_64')

depends=('alsa-lib' 'caps' 'ladspa')
optdepends=('swh-plugins: to use the mbeq equalizer (15-band)')
install=alsaequal.install

source=("alsaequal::git+https://github.com/bassdr/alsaequal#tag=$pkgver")
sha256sums=('SKIP')

#prepare() {
  #cd "$pkgname"
  #for f in "$srcdir"/*.patch; do patch < "$f"; done
#}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -dm755 "$pkgdir" /usr/lib/alsa-lib
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}
