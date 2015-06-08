# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributer: OK100 <ok100 at lavabit dot com>
# Contributer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=compton
pkgver=0.1_beta2
pkgrel=5
pkgdesc="X Compositor (a fork of xcompmgr-dana)"
arch=(i686 x86_64)
url="https://github.com/chjj/compton"
license=('MIT')
depends=('libgl' 'libdbus' 'libxcomposite' 'libxdamage' 'libxrandr' 'pcre' 'libconfig' 'libxinerama')
makedepends=('asciidoc' 'mesa')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans')
source=("https://github.com/chjj/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('fed786fa5ee9eb89df02291f2cc6e04d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix version
  sed -i "s:\(COMPTON_VERSION ?= \)git.*:\1v${pkgver}:" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr
  make docs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" install

  # install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # example conf
  install -D -m644 "compton.sample.conf" "$pkgdir/etc/xdg/compton.conf.example"
}
