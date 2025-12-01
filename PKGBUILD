# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
# Contributor: Carsten Feuls (DL1CAF) <archlinux@carstenfeuls.de
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>

pkgname=('svxlink')
pkgver=25.05.1
pkgrel=1
arch=('x86_64')
url="https://github.com/sm0svx/svxlink"
license=('GPL-2.0-only' 'LGPL-2.1-only')
source=("https://github.com/sm0svx/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1cf152511394158f9ead60aff092a5f8fb0d0da5378a68e0a641652ef752887f')
depends=('gsm' 'alsa-lib' 'openssl' 'speex' 'opus' 'python' 'popt' 'libgpiod'
         'libsigc++' 'gcc-libs' 'curl' 'libgcrypt' 'rtl-sdr' 'bash' 'python-yaml'
         'python-requests' 'tcl' 'libogg' 'jsoncpp' 'python-cryptography')
makedepends=('cmake' 'doxygen')
pkgdesc="Advanced repeater controller and EchoLink software for Linux"
optdepends=('svxlink-sounds-en_us-heather-16k: provides speech sound files in high quality')
backup=('etc/svxlink/svxlink.conf'
        'etc/svxlink/TclVoiceMail.conf'
        'etc/svxlink/remotetrx.conf'
        'etc/svxlink/svxlink.d/ModuleDtmfRepeater.conf'
        'etc/svxlink/svxlink.d/ModuleEchoLink.conf'
        'etc/svxlink/svxlink.d/ModuleHelp.conf'
        'etc/svxlink/svxlink.d/ModuleMetarInfo.conf'
        'etc/svxlink/svxlink.d/ModuleParrot.conf'
        'etc/svxlink/svxlink.d/ModulePropagationMonitor.conf'
        'etc/svxlink/svxlink.d/ModuleSelCallEnc.conf'
        'etc/svxlink/svxlink.d/ModuleTclVoiceMail.conf')
install=svxlink.install

build(){
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DSYSTEMD_CONFIGURATIONS_FILES_DIR=/usr/lib/systemd/system \
        -DCMAKE_INSTALL_SBINDIR=/usr/bin \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DLOCAL_STATE_DIR=/var \
        -DWITH_SYSTEMD=ON \
        -DUSE_QT=OFF ..
  make
  make doc
}

package(){
  make -C ${srcdir}/${pkgname}-${pkgver}/src/build DESTDIR="${pkgdir}" install
}
