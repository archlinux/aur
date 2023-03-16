# Maintainer: Petr Kopecky <xkejpi at gmail dot com>

pkgname=abracadabra
_appname=AbracaDABra
pkgver=2.1.1
pkgrel=1
pkgdesc="Abraca DAB radio: DAB/DAB+ Software Defined Radio (SDR)"
arch=("x86_64" "aarch64")
url="https://github.com/KejPi/${_appname}"
license=("MIT")
depends=("faad2" "mpg123" "portaudio" "qt6-multimedia" "qt6-svg" "qt6-imageformats" "rtl-sdr" "soapysdr")
optdepends=("airspy: support for AirSpy devices"
            "soapysdr: support for SopaySDR vendor neutral and platform independent SDR support library" 
	    "soapyairspy: Soapy SDR plugin for Airspy" 
	    "soapybladerf: Soapy SDR plugin for bladeRF" 
	    "soapyhackrf: Soapy SDR plugin for HackRF" 
	    "soapyosmo: Soapy SDR plugin for OsmoSDR" 
	    "soapyplutosdr: Soapy SDR plugin for Pluto SDR" 
	    "soapyrtlsdr: Soapy SDR plugin for RTLSDR" 
	    "soapysdrplay: Soapy SDR plugin for SDR Play")
makedepends=("cmake" "gcc" "qt6-tools" "qt6-translations")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${_appname}-${pkgver}.tar.gz::https://github.com/KejPi/${_appname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4abe3a75f06c8e72eea11996aa68ef1c7fe24a25c579b81465f0e5c804d5bf8b")

build() {
  mkdir -p "${srcdir}/${_appname}-${pkgver}/build"
  cd "${srcdir}/${_appname}-${pkgver}/build"
  cmake "${srcdir}/${_appname}-${pkgver}" -DSOAPYSDR=ON -DAIRSPY=ON -DPROJECT_VERSION_RELEASE=ON 
  make
}

package() {
  cd "${srcdir}/${_appname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
