# Maintainer: thadah <thadahdenyse@protonmail.com>
pkgname=commet-bin
pkgver=0.4.2+hotfix.1
pkgrel=1
pkgdesc="A client for Matrix focused on providing a feature rich experience while maintaining a simple interface"
url="https://commet.chat"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libdrm'
  'libepoxy'
  'libkeybinder3'
  'libsoup3'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'mesa'
  'mpv'
  'pango'
  'webkit2gtk-4.1'
  'zlib'
)
provides=('commet')
conflicts=('commet')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/commetchat/commet/releases/download/v${pkgver}/commet-ubuntu-24.04-x64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('8396c8ef1c39ffde32d64c141256c3570e36d14b0416d03dfa24e095a6c78d05')

package() {
  cd "${srcdir}"
  bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.zst
  bsdtar -xf data.tar.zst -C "${pkgdir}/"

  # Remove files that shouldn't be installed
  rm -f "${pkgdir}/commet-linux-x64.deb"
  rm -f "${pkgdir}/usr/lib/.gitkeep"

  # Create symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/lib/chat.commet.commetapp/commet "${pkgdir}/usr/bin/commet"
}
