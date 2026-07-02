# Maintainer: chwair <74615216+chwair@users.noreply.github.com>
pkgname=magnolia
pkgver=2.2.2
pkgrel=1
pkgdesc="Media torrent streaming client with embedded mpv"
arch=('x86_64')
url="https://github.com/chwair/magnolia"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'openssl'
  'fontconfig'
  'freetype2'
  'harfbuzz'
  'libpng'
  'libjpeg-turbo'
  'libwebp'
  'brotli'
  'bzip2'
  'expat'
  'pcre2'
  'zstd'
  'xz'
  'lz4'
  'libthai'
  'gcc-libs'
)
optdepends=(
  'libva: hardware video decode (VA-API)'
)
options=('!strip' '!debug')
# The .deb bundles libmpv and its codec closure; host-coupled libraries
# (glib/X11/openssl/...) are resolved from the system, hence depends above.
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Magnolia_${pkgver}_amd64.deb")
sha256sums=('SKIP')
noextract=("${pkgname}-${pkgver}.deb")

package() {
  # Extract the deb's data archive straight into the package root
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"

  # Permissions hygiene: dpkg archives may carry group-write bits
  chmod -R go-w "$pkgdir"
}
