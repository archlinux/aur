# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>

pkgname=arthas
pkgver=3.7.1
pkgrel=1
pkgdesc="Arthas is a Java Diagnostic tool open sourced by Alibaba"
arch=('x86_64')
url="https://github.com/alibaba/arthas"
license=('APACHE')
depends=('java-runtime-headless>=6')
source=(
    "arthas-$pkgver.zip::https://github.com/alibaba/arthas/releases/download/arthas-all-${pkgver}/arthas-bin.zip"
    "arthas.sh"
)
sha256sums=(
    '0478fc715bdb4c6a35e42b7e79a14253eddb212d290291b8b68a565b446ecdae'
    'ce16fa1a08024a4b41c1a0017d3f0d8e155599c6d99f99bb56eac6f3ddc21069'
)

package() {
    mkdir -p "$pkgdir"/opt/arthas/{async-profiler,lib}
    cp -rp "$srcdir"/arthas-*.jar "$srcdir"/arthas.properties "$srcdir"/logback.xml "$pkgdir"/opt/arthas/
    cp -rp "$srcdir"/async-profiler/*linux-x64* "$pkgdir"/opt/arthas/async-profiler/
    cp -rp "$srcdir"/lib/*.so "$pkgdir"/opt/arthas/lib/
    rm -f "$pkgdir"/opt/arthas/arthas-demo.jar
    rm -f "$pkgdir"/opt/arthas/lib/libArthasJniLibrary-aarch64.so
    install -Dm755 arthas.sh "$pkgdir"/usr/bin/arthas
}
