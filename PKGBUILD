pkgname=zrge
pkgver=1.0.7
pkgrel=1
pkgdesc="Zer Graphic Editor (zrge) is a simple raster graphic editor designed to work with the ZPIF, PNG, and JPEG formats."
arch=('x86_64')
url="https://github.com/Zer-Team/ZRGE"
license=('GPL3')
depends=(
 'sfml=3.0.0'
 'gcc'
)
source=("https://github.com/Zer-Team/ZRGE/archive/refs/tags/1.0.7.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ZRGE-1.0.7"
    g++ -c src/compress.cpp -o build/compress.o
    g++ -c src/main.cpp -o build/main.o
    g++ -c src/load_image.cpp -o build/load_image.o
    g++ -c src/parser.cpp -o build/parser.o
    g++ -c src/graphics.cpp -o build/graphics.o
    g++ -c src/save_image.cpp -o build/save_image.o
    g++ -c src/draw.cpp -o build/draw.o

    g++ -g build/load_image.o build/draw.o build/graphics.o build/parser.o build/compress.o build/save_image.o build/main.o -o zrge -lsfml-graphics -lsfml-window -lsfml-system -std=c++20

}

package() {
    cd "$srcdir/ZRGE-1.0.7"
    install -Dm755 zrge "$pkgdir/usr/bin/zrge"
    install -Dm644 -t "$pkgdir/usr/share/zrge/images" images/*
}
