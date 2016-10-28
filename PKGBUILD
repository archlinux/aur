# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=im
pkgver=3.12
pkgrel=1
pkgdesc="Toolkit for Digital Imaging."
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/im/"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('lua' 'tar')
source=("http://sourceforge.net/projects/imtoolkit/files/${pkgver}/Docs%20and%20Sources/${pkgname}-${pkgver}_Sources.tar.gz")
noextract=("${pkgname}-${pkgver}_Sources.tar.gz")
sha1sums=('b101433603645af96de88c406be48761369a7142')

prepare() {
  cd "$srcdir"
  # bdstar won't extract the 3.12 tarball
  tar -xaf "${pkgname}-${pkgver}_Sources.tar.gz"
  
  cd "$pkgname"
  find ./ -type d -exec chmod 0755 "{}" \;
  find ./ -type f -exec chmod 0644 "{}" \;
}

build() {
  cd "$srcdir/$pkgname"
  make -j1 USE_LUA53=Yes
}

package() {
  cd "$srcdir/$pkgname"
  
  mkdir -p "$pkgdir/usr/lib"
  install -m644 lib/Linux*/libim*.a "$pkgdir/usr/lib/"
  install -m755 lib/Linux*/libim*.so "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include"
  install include/* "$pkgdir/usr/include/"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
