# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=qimgv-gtk-bin
_pkgname=qimgv-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast and easy to use image viewer, GTK 3 rewrite of qimgv with JPEG XL, AVIF, HEIF, APNG and RAW support (prebuilt)'
arch=('x86_64')
url='https://github.com/TheElevatedOne/qimgv-gtk'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'glib2' 'gtk3' 'cairo' 'pango' 'gdk-pixbuf2' 'libjpeg-turbo' 'libpng' 'libwebp'
         'libjxl' 'libavif' 'libheif' 'libraw' 'exiv2' 'giflib' 'zlib')
provides=("$_pkgname=$pkgver" 'qimgv')
conflicts=("$_pkgname" 'qimgv')
# The release binary is built on Arch Linux by the GitHub workflow and already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix.
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('6e9d4231dc679b83913246be7ee11f41d525e17e79595871f49ea9dc75ea5460')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"
  install -Dm755 bin/qimgv -t "$pkgdir/usr/bin"
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
