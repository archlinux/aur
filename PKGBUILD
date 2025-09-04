# Maintainer: invverse <cheery DOT art2642 AT fastmail DOT com>
pkgname=gridtracker2-bin
_pkgname=GridTracker2
pkgver=2.250901.0
pkgrel=1
pkgdesc='An Amateur Radio Companion (unofficial)'
url='https://gridtracker.org'
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h')
source_x86_64=("https://download2.gridtracker.org/$_pkgname-$pkgver-x64.tar.gz")
source_aarch64=("https://download2.gridtracker.org/$_pkgname-$pkgver-arm64.tar.gz")
source_armv7h=("https://download2.gridtracker.org/$_pkgname-$pkgver-armv7l.tar.gz")
source=("$pkgname.desktop" "$pkgname.png" "$pkgname.install")
install=$pkgname.install
depends=('c-ares' 'http-parser' 'ffmpeg' 'gtk3' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
provides=('gridtracker2')
sha256sums=('f56a8857e15f87cbd6a8cd16eff0a2e588164561bd758a5cc1332158cef9d580'
            '9a81eb3ef1fb8e2e227e5d8632f53c0ce2474d17b44862843262449cff00c8f2'
            '98687391350dab02ef22f6782c5800292f8db24112a110763ef2a14137adafd1')
sha256sums_x86_64=('31127a886870180e468c0989f20c4562751ffce6c338adcee5727d5ae7f803b0')
sha256sums_aarch64=('3f5bbdc209ee4100f2d830c330446e10d79807cba775f7e4b899245bcdef5962')
sha256sums_armv7h=('7bd8819e261bce8bf332452a3cc811fca4541df800e494a3bb15051b24987ce2')
            
package() {
  # Determine architecture
  case "$CARCH" in
    x86_64) _arch="x64";;
    aarch64) _arch="arm64";;
    armv7h) _arch="arm7l";;
  esac
  
  # Install app to /opt/GridTracker2 and link to executable
  install -d -m755 "${pkgdir}/opt/${_pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${_pkgname}-${pkgver}-${_arch}/." "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/gridtracker2" "${pkgdir}/usr/bin/gridtracker2"  

  # Install desktop entry and icon
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
