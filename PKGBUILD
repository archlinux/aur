# Maintainer: Janek Thomaschewski <janek@jbbr.net>

pkgname=signal-desktop-bin
pkgver=1.0.35
pkgrel=1
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/WhisperSystems/Signal-Desktop'
license=('GPL3')
provides=('signal-desktop')
conflicts=('signal')
options=(!strip)
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'desktop-file-utils' 'libxss')

sha512sums=('f3a16443137323c486267f8b927156a974c8068e7c1d5a59386e2c43c5ae4f72a66d8023c59123c82663cf5f191f7a8b8117b727151a14a770584a43dc4d8eae'
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
