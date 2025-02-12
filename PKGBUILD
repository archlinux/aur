# Maintainer: invverse <cheery DOT art2642 AT fastmail DOT com>
pkgname=gridtracker2-bin
_pkgname=GridTracker2
pkgver=2.250201.1
pkgrel=2
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
sha256sums_x86_64=('60e1a9e148755126808f76656d8e7dc1d1ece1028c29a80a0d44514853e215c4')
sha256sums_aarch64=('0e623b0926e6d55c8f75929242a0637a447c3bd5f8db51165a92964c652adcde')
sha256sums_armv7h=('482240df6025a1f685caafce131ac9aae239a870e18e20733f63c85fab3d00c5')
            
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
