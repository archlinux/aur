pkgname=dispatch-workflows-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Desktop runner for sequential GitHub Actions workflows'
arch=('x86_64')
url='https://github.com/skorotkiewicz/dispatch-workflows'
license=('MIT')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('github-cli: authenticate using gh auth login instead of a token')
provides=("dispatch-workflows=${pkgver}")
conflicts=('dispatch-workflows')
options=('!strip' '!debug')

_tag=v1.0.1
source=('LICENSE' 'dispatch-workflows.desktop')
source_x86_64=("${pkgname}-${pkgver}.tar.zst::${url}/releases/download/${_tag}/stable-linux-x64-Dispatch.tar.zst")
sha256sums=('a9e9f7748e5191da4c9ecddcf2f2807b7c0339b08438773cf67c8359419d3945'
            'ad2fee919d27116fee70435a9da9f107fea549ba6c46b173f241d8a1369ba4b3')
sha256sums_x86_64=('b8840ec1bd384286e15b51ed0d70139e45f8bd4763ef7bf01e698b678a48307c')

package() {
  install -dm755 "${pkgdir}/opt/dispatch-workflows" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/Dispatch/." "${pkgdir}/opt/dispatch-workflows/"
  ln -s /opt/dispatch-workflows/bin/launcher "${pkgdir}/usr/bin/dispatch-workflows"
  install -Dm644 "${srcdir}/dispatch-workflows.desktop" \
    "${pkgdir}/usr/share/applications/dispatch-workflows.desktop"
  install -Dm644 "${srcdir}/Dispatch/Resources/app/public/favicon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dispatch-workflows.svg"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
