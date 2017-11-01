# Maintainer: Janek Thomaschewski <janek@jbbr.net>

pkgname=signal-desktop-bin
pkgver=1.0.34
pkgrel=3
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/WhisperSystems/Signal-Desktop'
license=('GPL3')
provides=('signal-desktop')
conflicts=('signal')
options=(!strip)
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'desktop-file-utils' 'libxss')

sha512sums=('f038c1461abd4e97b49560f05d82145d2c905830e48e48bcd5ebb83a0c988368a66dee65487a0e08c497d399b626a93b77e15845d409c9c5b5cc8cd5e33fdfac'
            'f04626ca425f79129616ba25732b07b0fc50aab1dbe9bd3e79514e8a0ba3b382ee37f99ad9f32ca9359fbe1db3efe67d0d207610836634d28c2401b5729f07af')
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${pkgver}_amd64.deb"
        'signal-desktop')

prepare() {
    # Extract data
    bsdtar xf data.tar.xz
}

package() {
  # Recursively remove group's write permission before moving to package directory
  chmod -R g-w usr opt
  
  # move data
  mv opt "${pkgdir}"
  mv usr "${pkgdir}"
    
  mkdir "${pkgdir}/usr/bin"
  install -D -m755 signal-desktop "${pkgdir}/usr/bin/signal-desktop"
}
