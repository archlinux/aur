# Maintainer: Amadeus Folego <amadeusfolego@gmail.com>
# Maintainer: Terje Larsen <terlar@gmail.com>
pkgname=oni
pkgver=0.2.10
pkgrel=1
pkgdesc='An IDE built around Neovim'
arch=(any)
url="https://github.com/extr0py/oni"
license=('MIT')
depends=('nodejs' 'neovim-git' 'gconf' 'libxss')
makedepends=('tar')
source=("https://github.com/extr0py/${pkgname}/releases/download/v${pkgver}-recovery/Oni-${pkgver}-linux.tar.gz"
        "oni.sh"
        "oni.desktop"
        "icons.tar.gz")
        
sha256sums=('678bd1e7b555a57ec2b55753c8532740b976ac895dc912c62068da084f971225'
            '72a945d501f33cfc2fd0d8e832942ba75c09518abd2248973c4df461c3229aee'
            'edcda81d04ba34f5196d298e6848798f4bf5c6a00132a1fd9f6832d4cf120a3a'
            '9b09686c82ac5670ece59608288ab2124ee3147d404b77ac58c6ba332a6a148a')

package() {
  install -d ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/Oni-${pkgver}-linux/* ${pkgdir}/opt/${pkgname}
  install -Dm755 $srcdir/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  install -Dm644 oni.desktop "$pkgdir/usr/share/applications/oni.desktop"

  tar -xf ${srcdir}/icons.tar.gz
  for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 ${srcdir}/icons/$i.png "${pkgdir}/usr/share/icons/hicolor/$i/apps/oni.png"
  done
}
# vim:set ts=2 sw=2 et:
