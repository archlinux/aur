# Maintainer: Leonid Vaiman <vleon1@gmail.com>

pkgname='piscope'
pkgver=0.8
pkgrel=1
pkgdesc="piscope is a logic analyser (digital waveform viewer) for the Raspberry.  It shows the state (high or low) of selected GPIO in real-time."
url="http://abyz.me.uk/rpi/pigpio/"
license=('custom:LICENSE')
arch=('i686' 'x86_64' 'aarch64')
depends=('gtk3' 'glib2' 'pigpio')
source=("https://github.com/joan2937/${pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('b871116ac0e1c879dbe20f7907e75bb958ad76ef1bfcba91fc3f188f4b8e15a0')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -e 's/sudo //' -i Makefile
  sed -e 's|/usr/local/bin|\$(DESTDIR)/usr/bin|' -i Makefile
  sed -e 's|/usr/share|\$(DESTDIR)/usr/share|' -i Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
