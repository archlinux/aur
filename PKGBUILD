# Maintainer: Michael Schubert <mschu.dev at google mail>
pkgname=copasi
pkgver=4.24.197
_pkgver=${pkgver##*.}
pkgrel=1
pkgdesc="COmplex PAthway SImulator for analysis of biochemical networks and their dynamics"
arch=('i686' 'x86_64')
url="http://www.copasi.org/"
license=('Artistic 2.0')
depends=('shared-mime-info' 'qtwebkit' 'glu')
source=('copasi-desktop.tar.gz')
install=copasi.install
noextract=($pkgname-$pkgver.tar.gz)
_source=https://github.com/copasi/COPASI/releases/download/Build-$_pkgver
source_i686=($pkgname-$pkgver.tar.gz::$_source/COPASI-$pkgver-Linux-32bit.tar.gz)
source_x86_64=($pkgname-$pkgver.tar.gz::$_source/COPASI-$pkgver-Linux-64bit.tar.gz)
sha256sums=('9576e4a9b2c7e74c91d0e1c0b39fcb20531e8fb4f21c5e8ac95b048609702923')
sha256sums_i686=('c31ce85b32f463980255709b7a84c89a7201d51ba13871f4a3884e2e4ad9bcdf')
sha256sums_x86_64=('c31ce85b32f463980255709b7a84c89a7201d51ba13871f4a3884e2e4ad9bcdf')

package() {
  cd "$srcdir"
  tar -xf $pkgname-$pkgver.tar.gz --strip=1

  # install program files
  install -d "$pkgdir"/usr/{bin,share}
  install -m755 bin/* "$pkgdir"/usr/bin
  cp -R share/$pkgname "$pkgdir"/usr/share/
  
  # desktop integration...
  cd "$srcdir"/$pkgname-desktop
  install -Dm755 copasi.sh "$pkgdir/etc/profile.d/copasi.sh"
  install -Dm644 copasi.desktop "$pkgdir/usr/share/applications/copasi.desktop"
  install -Dm644 copasi.xml "$pkgdir/usr/share/mime/packages/copasi.xml"
  install -d "$pkgdir/usr/share/icons/hicolor"
  cp -R icons/* "$pkgdir/usr/share/icons/hicolor/"
  # copasi starts CopasiUI after setting COPASIDIR environment variable
  # useful for launching COPASI using the menu entry
  install -Dm755 copasi "$pkgdir/usr/bin/copasi"
}
