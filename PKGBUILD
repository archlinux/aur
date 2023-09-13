# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo
# Contributor: aliu

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.8.0
pkgrel=3
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('x86_64')
depends=('libasound.so' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libvips' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'openjpeg2' 'pango' 'vulkan-icd-loader')
makedepends=('unzip')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/upscayl/upscayl/releases/download/v${pkgver}/upscayl-${pkgver}-linux.zip"
  'upscayl-run'
)

sha512sums=(
  'b773c4a9c73de1d468f64d43987fdf7ea8ecf1590f6a476aa69d3243b93bcdcc1706eaf95cec576a4bed537ea6d3237ab658ebffabf3285b5ab2d6cc76883cc1'
  '7a1a702418325085d6afab949efe7724c4db42dc5a165ade02ff5b1d755fdcac5b8292cf3ee26b04e85a8f41343e1a5d36dba72afc5c6731a3bc3ea49b6c2193'
)

noextract=("upscayl-${pkgver}-linux.zip")

prepare() {
  cd "$srcdir"
  install -dm755 "$_pkgname"
  cd "$_pkgname"
  unzip ../upscayl-${pkgver}-linux.zip
  rm icon_128x128.png
}

package() {
  cd "$srcdir"

  # Licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  mv "$_pkgname"/LICENSE* "$pkgdir"/usr/share/licenses/$pkgname/

  # Launcher
  install -Dm755 upscayl-run "$pkgdir"/usr/bin/upscayl-run
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/share/pixmaps
  mv "$_pkgname"/org.upscayl.Upscayl.desktop "$pkgdir"/usr/share/applications/
  mv "$_pkgname"/icon_512x512.png "$pkgdir"/usr/share/pixmaps/org.upscayl.Upscayl.png

  # App directory
  install -dm755 "$pkgdir"/usr/lib
  mv "$_pkgname" "$pkgdir"/usr/lib/
}
