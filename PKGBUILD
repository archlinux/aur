# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=im
_pkglongname=imtoolkit
pkgver=3.8.2
pkgrel=2
pkgdesc="Toolkit for Digital Imaging."
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/im/"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('lua')

source=(http://sourceforge.net/projects/${_pkglongname}/files/${pkgver}/Docs%20and%20Sources/${pkgname}-${pkgver}_Sources.tar.gz)
sha1sums=('1fd36cdef7c704ca6269fb2de697d439d361c9ba')

build() {
  cd "$srcdir/$pkgname"
  
  find ./ -type d -exec chmod 0755 "{}" \;
  find ./ -type f -exec chmod 0644 "{}" \;
  
  make -j1
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
