# Maintainer: Sieve Lau <sievelau@gmail.com>
pkgname=bililiverecorder-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="BiliBili Stream Recorder. Pre-compiled."
arch=('x86_64')
url="https://github.com/BililiveRecorder/BililiveRecorder"
license=('GPL3')
makedepends=('unzip')
provides=('bililiverecorder')
conflicts=('bililiverecorder')

source=("https://github.com/BililiveRecorder/BililiveRecorder/releases/download/v${pkgver}/BililiveRecorder-CLI-linux-x64.zip")
noextract=('BililiveRecorder-CLI-linux-x64.zip')

sha256sums=('81f56e33b332a2a00ee6be3d7bfd06510172257cedaf9e98555289989b027d1a')

prepare(){
  unzip -o BililiveRecorder-CLI-linux-x64.zip -d ${pkgname/-bin/}
}

package() {
  _execfile=BililiveRecorder.Cli
  mkdir -p "${pkgdir}/opt/${pkgname/-bin/}"
  cp -r ${srcdir}/${pkgname/-bin/}/* ${pkgdir}/opt/${pkgname/-bin/}/
  find ${pkgdir}/opt/${pkgname/-bin/} -type f -exec chmod 444 {} \;
  chmod +x ${pkgdir}/opt/${pkgname/-bin/}/${_execfile}
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname/-bin/}/${_execfile} ${pkgdir}/usr/bin/${_execfile}
}
