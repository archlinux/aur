# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=androidtoolkit-bin
_pkgname=androidtoolkit
pkgver=1.4.4
_pkgver=1
pkgrel=4
pkgdesc="Desktop tools for Android developers, supports Windows, Mac and Linux."
arch=('x86_64')
url="https://github.com/LazyIonEs/AndroidToolKit"
license=('MIT')
conflicts=("androidtoolkit-git" "androidtoolkit")
install="androidtoolkit.install"
depends=(alsa-lib libxrender libglvnd java-runtime libxext libxtst zlib libxi gcc-libs libx11 glibc fontconfig)
source=(
	"${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb"
    "LICENSE"
)
sha256sums=('7a2651b28fed15ac312c9d919846d8ae13be32fe7d14ebf950baced56d83f633'
            '5d8e7b77c07cdf97d60ed2ec16478fa46ff34b00a00ed87ba4870a25333b8850')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar -I zstd -xvf data.tar.zst -C "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    find "$pkgdir" -type d -exec chmod 755 {} \;
    chmod a+x "$pkgdir/opt/androidtoolkit/lib/app/resources/aapt2"
}
