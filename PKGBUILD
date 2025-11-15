# Maintainer: steelt <steeltitanium1 at gmail dot com>

pkgname=rvx-builder
pkgver=3.18.7
pkgrel=2
pkgdesc="A NodeJS ReVanced Extended Builder"
arch=("x86_64")
url="https://github.com/inotia00/rvx-builder"
license=("GPL-3.0-only")
depends=("nodejs" "java-environment>=17")
makedepends=("npm")
optdepends=(
  "android-tools: required only for rooted phones"
  "electron: for opening rvx-builder in a seperate window"
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/inotia00/rvx-builder/archive/refs/tags/v$pkgver.tar.gz"
  "rvx-builder.sh"
  "rvx-builder.desktop"
  "rvx-builder.png"
)
noextract=("${pkgname}-${pkgver}.tar,gz")
sha256sums=('949b9edd89a0a29a777d9b42ddd15814e17a16a9e3068dfcf09825cb650d1cd2'
            '303b1f039d4f384b1f5c7e3fbc831d1321676f79b043f83824e48f166a10235a'
            'ec881952d60744851d5827b1fa28f129db498656cff73357f819e301811861af'
            '2b4943f5ada85a5dfb73d8e28d3d14e0f7f4eaa4f4072feca02e3a9b54500406')
package() {
  npm install -g --prefix "${pkgdir}/usr" --no-bin-links --cache "${srcdir}/npm-cache" --omit=dev "${srcdir}/${pkgname}-${pkgver}.tar.gz" 

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/192x192/apps"
  install -Dm755 "$srcdir/rvx-builder.sh" "$pkgdir/usr/bin/rvx-builder"
  install -Dm644 "$srcdir/rvx-builder.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/rvx-builder.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps"
}
