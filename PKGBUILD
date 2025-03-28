# Maintainer: Sieve Lau <sievelau@gmail.com>
pkgname=bililiverecorder-bin
pkgver=2.15.2
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

sha256sums=('1a548503e3ba5bf87a816d2c4f2308538f84b35fa3ccb754b23fac3a15d895ac')

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
