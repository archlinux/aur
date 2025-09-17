# Maintainer: steelt <steeltitanium1 at gmail dot com>

pkgname=rvx-builder
pkgver=3.18.6
pkgrel=1
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
sha256sums=('8828ec486c4d145209113e2373d4c71ffc8ad71ded983320e491c2363303ef3a'
            '3fdb61a644d1b8f9506a932330319b34ed023fe9e3c5712df340cc6ed1e2fc12'
            'ec881952d60744851d5827b1fa28f129db498656cff73357f819e301811861af'
            '2b4943f5ada85a5dfb73d8e28d3d14e0f7f4eaa4f4072feca02e3a9b54500406')
build() {
  cd $pkgname-$pkgver
  npm i
}

package() {
  rm -rf "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/192x192/apps"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  install -Dm755 "$srcdir/rvx-builder.sh" "$pkgdir/usr/bin/rvx-builder"
  install -Dm644 "$srcdir/rvx-builder.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/rvx-builder.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps"
}
