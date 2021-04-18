# Maintainer: ransome <ransome@uber.space>
pkgname="sleek"
pkgver=1.0.0
pkgrel=1
pkgdesc="Todo app based on the todo.txt format for Linux, free and open-source"
arch=("x86_64")
url="https://github.com/ransome1/sleek/"
license=("MIT")
options=(!strip)
makedepends=("npm")
depends=("electron")
source=("${url}archive/refs/tags/v${pkgver}.zip" "${$pkgname}.desktop" "${$pkgname}.sh")
sha512sums=("5640346112e259d48df4c2f3e60fdf070a262438612fddcf35bc36dea47710a987def1e816ca839cf5cc195599ce0526d322d371b43339e14ba2aadf43d2a86c")

build() {
  unzip -o "v${pkgver}.zip"
  cd "$srcdir/$pkgname-${pkgver}"
  npm install
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"
  npm run pack
  install -Dm644 "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
  install -d -Dm644 "${pkgdir}/usr/share"
  cp -r "dist/linux-unpacked/${pkgname}" "${pkgdir}/usr/share"
  install -Dm755 "aur/${pkgname}.sh" -t "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "aur/${pkgname}.desktop" -t "$pkgdir/usr/share/applications/"
}
