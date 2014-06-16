# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=imgv
pkgver=3.1.5
pkgrel=2
pkgdesc="A feature rich image viewer including a GUI"
url="http://imgv.sourceforge.net/"
license=('GPL')
arch=('i686')
depends=('bash' 'python-pygame' 'pil')
makedepends=('hd2u')
install=imgv.install
source=(http://downloads.sourceforge.net/imgv/$pkgname-$pkgver-src.tar.gz imgv.diff imgv.profile imgv.sh)
md5sums=('42378425b2470daedcc0f3e34c25b6e0' 'ef78916636a26b84c1bd55c430146bdc'\
         'bd0daba52c3165b38ba5a7b61ec0a94d' '60a287e055f6b17ba864c207cb78d9b2')

build() {
  cd $srcdir/$pkgname-$pkgver-src
  install -d $pkgdir/usr/share/imgv
  dos2unix *.py data/{imgv.conf,playlists}
  patch -p1 <$srcdir/imgv.diff
  cp -r * $pkgdir/usr/share/imgv/
  install -Dm755 $srcdir/imgv.profile $pkgdir/etc/profile.d/imgv.sh
  install -Dm755 $srcdir/imgv.sh $pkgdir/usr/bin/imgv
  sed -i 's|COLOR|#COLOR|g' $pkgdir/usr/share/imgv/data/imgv.conf
  sed -i 's|CACHE_DIRS|#CACHE_DIRS|g' $pkgdir/usr/share/imgv/gl.py

}
