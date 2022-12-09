pkgname=vapoursynth-plugin-frameblender
pkgver=1.2
pkgrel=1
pkgdesc="Modified version of VapourSynth's AverageFrames which allows for more weights"
arch=('any')
url="https://github.com/couleurm/vs-frameblender"
license=('unknown')
depends=('vapoursynth')
makedepends=('clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/couleurm/vs-frameblender/archive/${pkgver}.tar.gz")
sha256sums=('647edc03818bc87b1f23116f474292bf9dcadeafe456af15404a93666590f1cd')

build() {
    cd "vs-frameblender-$pkgver/vs-frameblender"
	clang++ main.cpp -shared -std=c++17 -O3 -march=native -I./vapoursynth -o ./libframeblender.so
}

package() {
    cd "vs-frameblender-$pkgver/vs-frameblender"
	install -Dm0755 -t "$pkgdir/usr/lib/vapoursynth" "libframeblender.so"
}
