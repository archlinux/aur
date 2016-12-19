pkgname=onlyoffice-bin
pkgver=4.1.2
pkgrel=42
pkgdesc='The most complete and feature-rich office and productivity suite'
arch=('x86_64')
url='http://www.onlyoffice.com/'
depends=("libx11" "libxss" "curl" "gtkglext" "cairo" "libstdc++5" "ttf-dejavu" "ttf-liberation" "libcurl-gnutls" "libcurl-compat")
makedepends=('w3m')
license=('AGPL-3.0')
source=("http://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb")
sha256sums=('SKIP')

package() {
  tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  #suid sandbox
  chmod 4755 "${pkgdir}/opt/onlyoffice/desktopeditors/chrome-sandbox"

  #fix wrong depedency
  ln -s "/usr/lib/libcurl.so.3" "${pkgdir}/opt/onlyoffice/desktopeditors/converter/libcurl.so.4"

  for res in 16 24 32 48 64 128 256; do
    install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/asc-de-${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/asc-de.png"
  done
  
  cat "${pkgdir}/opt/onlyoffice/desktopeditors/LICENSE.htm" | w3m -I 'utf-8' -T 'text/html' > "${pkgdir}/opt/onlyoffice/desktopeditors/LICENSE"
  install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/LICENSE"        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/3DPARTYLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"

}