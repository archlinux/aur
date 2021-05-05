# Maintainer: ransome <ransome@uber.space>
pkgname="sleek"
pkgver=1.0.2
pkgrel=1
pkgdesc="Todo app based on the todo.txt format for Linux, free and open-source"
arch=("x86_64")
url="https://github.com/ransome1/sleek/"
license=("MIT")
options=(!strip)
makedepends=("yarn")
depends=("electron" "nodejs")
source=("${url}archive/refs/tags/v${pkgver}.zip" "sleek.desktop" "sleek.sh")
<<<<<<< HEAD
sha512sums=('66039ad58f04267af5a6305d3ef68fd580e4d7327dbaf68bdb0c6235acd1235f206698cddfdeef2f1c7b14c8a4bf93457c49d7acbed05e6d14f8bddccaa99924'
=======
sha512sums=('24457a25cbe71ec45927945f45fe9866ca83f23d885abc88593a7f50fb2c232b62bb2a13138568a4ce14145113408063d24e413d0f5ff4bf44c96f7b2439b1bf'
>>>>>>> da1be3e6fa482146559e4456797868e0e0087c04
            '60777dbda8202e5a265a274d126d30269fb8fba67641d22a83be19b353b4805cbed2a3c80bbc0e6ed7c0fe7ae21c3cde59b784d42d3ba941bb0fdf022c1375e8'
            'ea1d322bd56c7944a9eae97f4968a6a2e937b510eb3c1c21266428450c5b2ddcd8576718d0b66b69fbce5694ba94e80a692d04bda1e8c2b24a8d814a5ed50963')

build() {
  msg2 "Unzipping v${pkgver}.zip"
  unzip -o "v${pkgver}.zip"
  cd "$srcdir/$pkgname-${pkgver}"

  msg2 "Installing node modules"
  yarn install
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  msg2 "Building sleek with packaged Electron"
  yarn run pack
  install -Dm644 "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
  install -d -Dm644 "${pkgdir}/usr/share"
  chmod 755 "${pkgdir}/usr/share"
  cp -r "dist/linux-unpacked/${pkgname}" "${pkgdir}/usr/share"

  msg2 "Installing LICENSE"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 "Installing startup script and desktop file"
  install -Dm755 "../${pkgname}.sh" -t "$pkgdir/usr/bin/"
  install -Dm644 "../${pkgname}.desktop" -t "$pkgdir/usr/share/applications/"

  msg2 "Installing icons"
  for size in 22 24 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
  install -Dm644 "assets/icons/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
