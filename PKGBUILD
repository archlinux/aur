#..................................................
# Note: this install *binary* libraries and tools
#..................................................
#
# Maintainer : Daniel T. Borelli < daltomi@opmbx.com >
#

pkgname=orx
pkgver=1.8
pkgrel=1
pkgdesc='ORX: Portable Game Engine'
arch=('i686' 'x86_64')
url="http://orx-project.org"
license=('zlib/libpng')
depends=('openal' 'libsndfile' 'mesa-libgl')

if test "$CARCH" == x86_64; then
  _dev=linux64
  md5sums=('d56a1c2c274a7c06eec5db679a179e9f')
else
 _dev=linux32
 md5sums=('00c0bbb2c6423ec9f5d63ac844815663')
fi 
source=("https://github.com/orx/orx/releases/download/${pkgver}/orx-dev-${_dev}-${pkgver}.tar.bz2")

package() {
 # make dirs
 install -d $pkgdir/usr/lib $pkgdir/usr/include/orx $pkgdir/usr/share/doc/orx $pkgdir/usr/bin
 
 cd "${srcdir}/orx-${pkgver}/"
 install -Dm0444 AUTHORS CHANGELOG COPYRIGHT LICENSE README* $pkgdir/usr/share/doc/orx

 # internal directory orx
 cd "dev-$_dev/"
 # copy files
 install -Dm0544 lib/*.so $pkgdir/usr/lib/
 install -Dm0555 tools/orxCrypt/bin/* $pkgdir/usr/bin/
 install -Dm0555 tools/orxFontGen/bin/* $pkgdir/usr/bin/
 install -Dm0444 *.ini $pkgdir/usr/share/doc/orx
 
 # copy files and dir. recursive
 install -Dm0444 include/*.h $pkgdir/usr/include/orx

 _includes=("anim base core debug display io main math memory object physics plugin plugin/define render sound utils")

 for _dir in ${_includes}
 do 
   install -d $pkgdir/usr/include/orx/${_dir}
   install -Dm0444 include/${_dir}/*.h  $pkgdir/usr/include/orx/${_dir}
 done
}

# vim:set ts=2 sw=2 et:
