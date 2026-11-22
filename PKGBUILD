# Maintainer: codevski <aur.deity726@passmail.net>

pkgname=ps5upload-bin
pkgver=12.6.21
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
            'b6596371fc9f4da30b64d30813b798b545b08ecc754547ed1b10c923ffb84666')
sha256sums_x86_64=('3ad91fe01b05680f75e308546cbd7acb332b2df848f3155f998933621e27ffc1')
sha256sums_aarch64=('8d62fea411848db481e88d12de8a52dde39bc287bdda1c98e8aad663f7e862f3')

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
