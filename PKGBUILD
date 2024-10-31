# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=mediadeepa
pkgver=0.1.0
_commit="101641763e2dd20ed0e4d1cb0226009fc5f32b6e"
pkgrel=1
epoch=
pkgdesc="Audio/video medias and streams deep analyser"
arch=("any")
url="https://gh.mexm.media/mediadeepa/"
license=("GPL-3.0-or-later")
depends=("bash" "ffmpeg>=5" "java-runtime>=21")
makedepends=("git" "maven")
source=(
    "git::git+https://github.com/mediaexmachina/mediadeepa#commit=${_commit}"
    "mediadeepa"
)
sha256sums=(
    "SKIP"
    "cc15cbaec42a15e92fc8202d07068c49c5e26d0e07d168f0731c364587c36995"
)

build() {
    cd "$srcdir/git"
    mvn install -DskipTests
}

check() {
    cd "$srcdir/git"
    mvn test
}

package() {
    install -Dm 644 "$srcdir/git/target/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar"
    ln -s "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
    install -Dm 755 mediadeepa -t "${pkgdir}/usr/bin"
}
