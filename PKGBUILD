# Maintainer: codevski <aur.deity726@passmail.net>

pkgname=ps5upload-bin
pkgver=7.1.11
pkgrel=1
pkgdesc="All-in-one PS5 companion app for uploading, installing and managing games over the network (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/phantomptr/ps5upload"
license=('GPL-3.0-or-later' 'LicenseRef-UnRAR')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("ps5upload=${pkgver}")
conflicts=('ps5upload')
options=('!strip' '!debug')
source=("UnRAR-license-${pkgver}.txt::https://raw.githubusercontent.com/phantomptr/ps5upload/v${pkgver}/LICENSES/UnRAR-license.txt"
        "UnRAR-exception-${pkgver}.md::https://raw.githubusercontent.com/phantomptr/ps5upload/v${pkgver}/LICENSES/UnRAR-exception.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/PS5Upload-${pkgver}-linux-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/PS5Upload-${pkgver}-linux-arm64.deb")
sha256sums=('d462353c1ec39604430d578dba3076833cf5af897d1542b3b052b38cfde2e2d0'
            'd5a405b2d5e7c56275206f5a18ac0ccf406ad3d0d92584d6951c3d7d81d03be0')
sha256sums_x86_64=('6774ee8ddeb1d234c03bfde08fd6f850375b5b0ae7b99593649193aa2da395cb')
sha256sums_aarch64=('608b8b0025bacd07399eb974236fa1c488b3de2f6b55e167f682b6081c0a1e28')

package() {
  # makepkg unpacks the .deb into control.tar.* + data.tar.*; the data
  # archive already has the final layout (binary, .desktop entry, icons).
  # Glob the compression suffix: upstream's packager may switch from gz.
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  # RAR extraction is compiled in from UnRAR, which carries its own licence.
  install -Dm644 "${srcdir}/UnRAR-license-${pkgver}.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/UnRAR-license.txt"
  install -Dm644 "${srcdir}/UnRAR-exception-${pkgver}.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/UnRAR-exception.md"
}
