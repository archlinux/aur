#..................................................
# Note: this install *binary* libraries and tools
#..................................................
#
# Maintainer : Daniel T. Borelli < daltomi@opmbx.com >
#

pkgname=orx
pkgver=1.7
pkgrel=1
pkgdesc='ORX: Portable Game Engine'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/orx/"
license=('zlib/libpng')
depends=('openal' 'libsndfile' 'mesa-libgl')

if test "$CARCH" == x86_64; then
  _dev=linux64
  md5sums=('b8c86348b07cda5effd02e0e1656a693')
else
 _dev=linux32
 md5sums=('c28ea2db81be3aec7b8b231830eeb3f2')
fi 

source=("https://sourceforge.net/projects/orx/files/orx/orx%20-%201.7%20%284092%29/orx-dev-${_dev}-${pkgver}.tar.bz2")

package() {
 # make dirs
 install -d $pkgdir/usr/lib $pkgdir/usr/include/orx $pkgdir/usr/share/doc/orx $pkgdir/usr/bin
 
 cd "${srcdir}/orx-${pkgver}/"
 install -Dm0755 AUTHORS CHANGELOG COPYRIGHT LICENSE README* $pkgdir/usr/share/doc/orx

 # internal directory orx
 cd "dev-$_dev/"
 # copy files
 install -Dm0755 lib/*.so $pkgdir/usr/lib/
 install -Dm0755 tools/orxCrypt/bin/* $pkgdir/usr/bin/
 install -Dm0755 tools/orxFontGen/bin/* $pkgdir/usr/bin/
 install -Dm0755 *.ini $pkgdir/usr/share/doc/orx
 
 # copy files and dir. recursive
 install -Dm0755 include/*.h $pkgdir/usr/include/orx

 _includes=("anim base core debug display io main math memory object physics plugin plugin/define render sound utils")

 for _dir in ${_includes}
 do 
   install -d $pkgdir/usr/include/orx/${_dir}
   install -Dm0755 include/${_dir}/*.h  $pkgdir/usr/include/orx/${_dir}
 done
}

# vim:set ts=2 sw=2 et:
