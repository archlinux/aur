# Maintainer: Mujtaba1i
# One-time hotfix pushed by .github/workflows/aur-hotfix.yml.
# Works with the existing v0.2.2 release (its tarball contains only the binary,
# so the .desktop file and icons are shipped in this AUR repo).

pkgname=archtoys-bin
pkgver=0.2.2
pkgrel=2
pkgdesc="System-wide color picker for Linux, inspired by PowerToys (precompiled binary)"
arch=('x86_64')
url="https://github.com/Mujtaba1i/Archtoys"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libglvnd' 'wayland' 'hicolor-icon-theme')
provides=("archtoys=${pkgver}")
conflicts=('archtoys')
options=('!debug')
source=("archtoys-linux-x86_64-v${pkgver}.tar.gz::https://github.com/Mujtaba1i/Archtoys/releases/download/v${pkgver}/archtoys-linux-x86_64.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Mujtaba1i/Archtoys/v${pkgver}/LICENSE"
        'archtoys.desktop'
        'archtoys.png'
        'archtoys-16.png'
        'archtoys-22.png'
        'archtoys-24.png'
        'archtoys-32.png'
        'archtoys-48.png'
        'archtoys-64.png'
        'archtoys-128.png'
        'archtoys-256.png'
        'archtoys-512.png')
sha256sums=('16990b0b0b9a420a87f55fd0aa206e54c6cff747990fddaea065ba23ec58660b'
            '24f09d6d1dc1534b8efcaca939ddec1969cac255471aae25d299ab8e81ada29f'
            '57caa2bef5a98bef17abeecb439e1ef7efab7826217b24ca1eaeac07c7720312'
            '5355e2b4f79c2bba7ac05a78dcc0e60f4f226f9222390204ef6a7a5294640f08'
            'e782f83cd1ba0f4179471251c56c15b7beae55285b3a6d55d2392fb81a4bc027'
            'f7a1502c230d2955db4da1f00d64bcaea47920cda4b3ae096503b696303cd6cf'
            '8f56c529e2a6829fd5a6428b3a84b4bac3c020d325ffc909370e859827539c78'
            '5e6ecfef3d0f756106acbb03cf406a0eb97baf811df8351339279bc725720027'
            'f1a61ee627c58a251b39994ebe796421dc8b9f4b370164d8251112f4d532aea9'
            'c0ef492619f05c719162685328088c7f234005ef4b9cd8b86f08b0d8cba42e57'
            'f3c1d903030433629585273f6ef97a724a6ad1cb64aa4cabc1d0bf0acfd0d8de'
            '8c3fbeb84a9ef2e6f3e2fbc3dade9b3691bd866eea78852a78f31463bb4ee8b5'
            '24fc53a20f0c092dbbd0a3233a75101147b3d3b8481df84bdce09baae183de8c')

package() {
  cd "${srcdir}"

  install -Dm755 archtoys "${pkgdir}/usr/bin/archtoys"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 archtoys.desktop "${pkgdir}/usr/share/applications/archtoys.desktop"

  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "archtoys-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/archtoys.png"
  done
  # archtoys.png is the 1024x1024 master icon (it used to overwrite the 256px one)
  install -Dm644 archtoys.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/archtoys.png"
}
