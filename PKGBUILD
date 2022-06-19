# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence
pkgver=0.9.2
pkgrel=1
pkgdesc="JACK toolbox for audio production."
arch=(x86_64)
url="https://kx.studio/Applications:Cadence"
license=(GPL2)
# NOTE: alsa-utils is required for aplay/ arecord calls
depends=(alsa-utils gcc-libs glibc hicolor-icon-theme jack2-dbus python-dbus
python-pyqt5 qt5-base qt5-svg)
makedepends=(a2jmidid jack_capture libpulse pulseaudio-jack
python-rdflib zita-ajbridge)
optdepends=(
  'a2jmidid: ALSA to JACK MIDI bridge'
  'jack_capture: recording via Cadence-Render'
  'pulseaudio-jack: PulseAudio to JACK bridge'
  'python-rdflib: LADSPA-RDF support in Carla'
  'zita-ajbridge: ALSA to JACK bridge'
)
options=(debug)
source=($pkgname-$pkgver.tar.gz::https://github.com/falkTX/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('d8a1b52c361e3e18a193d1c283bb69abe18ce667b554fc53cb9b752d92747269145144ae512895ffbb5df76efe8671cfc0782f29e59d0d7cd3d97c97240bdecf')
b2sums=('a5422e4d74618e2e45d9c6f275393a6e918783fc37d60a54142725aa54e691435c41f76dd0346fae7684c452988b07a18d817902abd917dbceaff5fb4aaa6c47')

build() {
  make -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" PREFIX=/usr install -C $_name-$pkgver
  install -vDm 644 $_name-$pkgver/{README.md,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"

  # removing claudia, as its runtime dependency ladish (dead) depends on
  # flowcanvas (dead)
  rm -rfv "$pkgdir/usr/bin/claudia"* \
          "$pkgdir/usr/share/applications/claudia"* \
          "$pkgdir/usr/share/$pkgname/"{icons,src}/{,ui_}claudia* \
          "$pkgdir/usr/share/icons/hicolor/"{128x128,16x16,256x256,48x48,scalable}/apps/claudia*
}
