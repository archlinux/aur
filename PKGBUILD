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
source=("${url}archive/refs/tags/v${pkgver}.zip" "sleek.desktop" "sleek.sh")
sha512sums=('5640346112e259d48df4c2f3e60fdf070a262438612fddcf35bc36dea47710a987def1e816ca839cf5cc195599ce0526d322d371b43339e14ba2aadf43d2a86c'
            '60777dbda8202e5a265a274d126d30269fb8fba67641d22a83be19b353b4805cbed2a3c80bbc0e6ed7c0fe7ae21c3cde59b784d42d3ba941bb0fdf022c1375e8'
            '13d651476d302af9d013c04c396c9b8f53114cf05adaf9cd80c0f452a6da8da45751e971cc2a6d2621d1480d04d6ba717aadf52982922ef9bfde867221b51845')

build() {
  unzip -o "v${pkgver}.zip"
  cd "$srcdir/$pkgname-${pkgver}"
  npm install
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"
  ls
  npm run pack
  install -Dm644 "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
  install -d -Dm644 "${pkgdir}/usr/share"
  cp -r "dist/linux-unpacked/${pkgname}" "${pkgdir}/usr/share"
  install -Dm755 "../${pkgname}.sh" -t "$pkgdir/usr/bin/"
  install -Dm644 "../${pkgname}.desktop" -t "$pkgdir/usr/share/applications/"
}
