# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=cd
_pkglongname=canvasdraw
pkgver=5.7
pkgrel=2
pkgdesc="C platform-independent graphics library."
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/cd/"
license=('MIT')
makedepends=('freetype2' 'libx11' 'libxpm' 'libxmu' 'libxft' 'gtk2' 'lua')
depends=('ftgl' 'im>=3.7' 'gtk2' 'pangox-compat')
optdepends=('lua: bindings for Lua are available')

source=("http://downloads.sourceforge.net/project/${_pkglongname}/${pkgver}/Docs%20and%20Sources/${pkgname}-${pkgver}_Sources.tar.gz")
sha1sums=('370f6e3f595554197f71536f527533f910c509eb')

build() 
{
  cd "$srcdir/$pkgname"
  
  find ./ -type d -exec chmod 0755 "{}" \;
  find ./ -type f -exec chmod 0644 "{}" \;
  
  make -j1
}

package() {
  cd "$srcdir/$pkgname"
	
  mkdir -p "$pkgdir/usr/lib"
  pushd lib
  install -m644 Linux*/libcd*.a "$pkgdir/usr/lib/"
  install -m755 Linux*/libcd*.so "$pkgdir/usr/lib/"
  install -m644 Linux*/libpdflib.a "$pkgdir/usr/lib/"
  install -m755 Linux*/libpdflib.so "$pkgdir/usr/lib/"
  popd
  mkdir -p "$pkgdir/usr/include"
  install include/* "$pkgdir/usr/include/"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
