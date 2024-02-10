# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: bionade24
# Contributor: vivaeltopo
# Contributor: aliu

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.9.9
pkgrel=1
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('x86_64')
depends=('libasound.so' 'gtk3' 'libvips' 'nodejs' 'nss' 'openjpeg2')
makedepends=('unzip')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
noextract=("upscayl-${pkgver}-linux.zip")
source=("https://github.com/upscayl/upscayl/releases/download/v${pkgver}/upscayl-${pkgver}-linux.zip")
sha512sums=('1b4d237ca6ce788a09fb8aefc3d160aa6b7afb51982ef1352827cf06ebda73a12ee7b651438f4dc22ba94bb8822661db6aa0e66b374f5e15799cb7a2686cfe16')

prepare() {
  cd "$srcdir"
  unzip upscayl-${pkgver}-linux.zip -x resources/128x128.png -d upscayl
  printf '%s\n' 'Icon=org.upscayl.Upscayl' >> "$_pkgname"/resources/org.upscayl.Upscayl.desktop
}

package() {
  cd "$srcdir"

  # Licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  mv "$_pkgname"/LICENSE* "$pkgdir"/usr/share/licenses/$pkgname/

  # XDG Launcher
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/pixmaps
  mv "$_pkgname"/resources/org.upscayl.Upscayl.desktop "$pkgdir"/usr/share/applications/
  mv "$_pkgname"/resources/512x512.png "$pkgdir"/usr/share/pixmaps/org.upscayl.Upscayl.png

  # App directory
  install -dm755 "$pkgdir"/opt
  mv "$_pkgname" "$pkgdir"/opt/

  # Symlink in $PATH
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
