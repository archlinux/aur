# Maintainer: Janek Thomaschewski <janek@jbbr.net>

pkgname=signal-desktop-bin
pkgver=1.0.36
pkgrel=1
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/WhisperSystems/Signal-Desktop'
license=('GPL3')
provides=('signal-desktop')
conflicts=('signal')
options=(!strip)
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'desktop-file-utils' 'libxss')

sha512sums=('e948404b41e5b65afe2f004a5d029320d834a8fb4a2abed235b435ee63b2b59a10eb8833cfa41a8899d8fd37de0fd922f246f39d89f01a43ac85f97f4c17c3cf'
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
