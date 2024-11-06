# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=androidtoolkit-bin
_pkgname=androidtoolkit
pkgver=1.5.1
pkgrel=1
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
sha256sums=(
  '5516c604fb98cebfcd13c3562a9918b83e35eb9ca23b1a34b212d039231959c4'
  '5d8e7b77c07cdf97d60ed2ec16478fa46ff34b00a00ed87ba4870a25333b8850'
)

package() {
  msg "Converting debian package..."
  cd "$srcdir"
  tar -I zstd -xvf data.tar.zst -C "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  find "$pkgdir" -type d -exec chmod 755 {} \;
  chmod a+x "$pkgdir/opt/androidtoolkit/lib/app/resources/aapt2"
  sed -i 's/^Categories=.*/Categories=Utility/' "$pkgdir/opt/$_pkgname/lib/androidtoolkit-AndroidToolKit.desktop"
}
