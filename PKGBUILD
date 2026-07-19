# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>

pkgname=arthas
pkgver=4.3.2
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
    'f35902aebb01efa5d9777a42358c023f022a9d4c3058b0ad477fa8da5b61f0aa'
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
