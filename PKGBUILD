# Maintainer: envolution
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Romain Porte <microjoe@microjoe.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Tom Swartz <tom@tswartz.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=cubicsdr
_pkgname=CubicSDR
pkgver=0.2.7
pkgrel=3
pkgdesc="Cross-Platform Software-Defined Radio Application"
arch=(x86_64 aarch64 armv7h i686)
url="https://cubicsdr.com"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  hamlib
  hicolor-icon-theme
  libglvnd
  libpulse
  liquid-dsp
  soapysdr
  wxwidgets-common
  wxwidgets-gtk3)
makedepends=(cmake)
optdepends=(
  'fftw: FFTW support'
  'limesuite: support for LimeSDR'
  'soapyairspy: support for Airspy R2 and Airspy Mini'
  'soapyhackrf: support for HackRF'
  'soapyosmo: support for MiriSDR and RFSpace'
  'soapyplutosdr: support for PlutoSDR'
  'soapyremote: use any SoapySDR device remotely over network'
  'soapyrtlsdr: support for RTL-SDR (RTL2832U) dongles'
  'soapysdrplay: support for SDRplay RSP')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cjcliffe/CubicSDR/archive/$pkgver.tar.gz")
sha256sums=('790f851e08f1068081a8593dfd4a149c7414e7d70c1f5cafd287331df493b811')

build() {
  cd "$_pkgname-$pkgver"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_HAMLIB=ON \
    -DENABLE_DIGITAL_LAB=ON \
    -DUSE_AUDIO_PULSE=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  ln -s /usr/bin/CubicSDR "$pkgdir/usr/bin/cubicsdr"
}
# vim:set ts=2 sw=2 et:
