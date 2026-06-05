# Maintainer: Ítalo Moiá <italo.moia@comercialpro.com.br>
# Template — release.yml fills 2.1.0 and e52a380f3bfd81a15f81615259e429e49532c2d13d94e88c53ad4b4d68313559 from the GitHub Release tarball.
pkgname=the-meditor-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="GitHub-quality Markdown viewer for Linux desktop (prebuilt binary)"
arch=('x86_64')
url="https://github.com/italomoia/the-meditor"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('the-meditor')
conflicts=('the-meditor')
options=('!strip')
source=("the-meditor-${pkgver}-linux-x86_64.tar.gz::https://github.com/italomoia/the-meditor/releases/download/v${pkgver}/the-meditor-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e52a380f3bfd81a15f81615259e429e49532c2d13d94e88c53ad4b4d68313559')

package() {
  cd "${srcdir}/the-meditor-${pkgver}-linux-x86_64"
  install -Dm755 the-meditor "${pkgdir}/usr/bin/the-meditor"
  install -Dm644 the-meditor.desktop "${pkgdir}/usr/share/applications/the-meditor.desktop"
  install -Dm644 the-meditor-markdown.xml "${pkgdir}/usr/share/mime/packages/the-meditor-markdown.xml"
  for sz in 32 48 64 128 256; do
    if [ -f "icons/${sz}x${sz}/the-meditor.png" ]; then
      install -Dm644 "icons/${sz}x${sz}/the-meditor.png" \
        "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/the-meditor.png"
    fi
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
