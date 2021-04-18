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
sha512sums=("5640346112e259d48df4c2f3e60fdf070a262438612fddcf35bc36dea47710a987def1e816ca839cf5cc195599ce0526d322d371b43339e14ba2aadf43d2a86c" "605f49606eb0656846ac5dc3b97eca0acb3a781b07c71aff1e027935d5e8ea569d290c95d67bd7347ddd133c1643e6f3c6fe36bd1b52f49e528b34a458afe316" "13d651476d302af9d013c04c396c9b8f53114cf05adaf9cd80c0f452a6da8da45751e971cc2a6d2621d1480d04d6ba717aadf52982922ef9bfde867221b51845")

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
