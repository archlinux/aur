# Maintainer: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
pkgname=apng-utils
pkgver=2.9
_apngdis_pkgver=2.8
_apngasm_pkgver=2.9
_gif2apng_pkgver=1.9
_apng2gif_pkgver=1.7
pkgrel=3
pkgdesc="apngasm for assembling apng files, apngdis for disassembling apng files, and gif2apng/apng2gif for converting."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/apngdis/"
# apngasm: http://sourceforge.net/projects/apngasm/
# gif2apng: http://sourceforge.net/projects/gif2apng/
# apng2gif: http://sourceforge.net/projects/apng2gif/
provides=( apngasm apngdis gif2apng apng2gif)
license=('LGPL')
depends=( 'libpng' 'gcc-libs' )
source=("http://sourceforge.net/projects/apngdis/files/${_apngdis_pkgver}/apngdis-${_apngdis_pkgver}-src.zip"
        "http://sourceforge.net/projects/apngasm/files/${_apngasm_pkgver}/apngasm-${_apngasm_pkgver}-src.zip"
        "http://sourceforge.net/projects/gif2apng/files/${_gif2apng_pkgver}/gif2apng-${_gif2apng_pkgver}-src.zip"
        "http://sourceforge.net/projects/apng2gif/files/${_apng2gif_pkgver}/apng2gif-${_apng2gif_pkgver}-src.zip"
)

noextract=( 
	"gif2apng-${_gif2apng_pkgver}-src.zip" 
	"apngasm-${_apngasm_pkgver}-src.zip" 
	"apng2gif-${_apng2gif_pkgver}-src.zip" 
	"apngdis-${_apngdis_pkgver}-src.zip" 
)

build() {
  cd "${srcdir}"
  
  # Several packages now use a different build approach than before.
  for _pack in "${noextract[@]}"; do
        _builddir=${_pack%%-*}
	mkdir $_builddir
  	bsdtar xf "${_pack}" --directory $_builddir
  
  	cd $_builddir
  	make ${MAKEFLAGS}
	
	cd "${srcdir}"
  done	
}

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/bin/"
  for _pack in "${noextract[@]}"; do
	_builddir=${_pack%%-*}
  	install -Dm755 "$_builddir/$_builddir" "$pkgdir/usr/bin/"
  done
}
md5sums=('2e8a430ae2a8c544af4965840d9fad23'
         'f2619444e125157ce22438e963a80c0b'
         '4e7336fe6b71c18ac830bb2977204819'
         '9877249603e7d01bc1970130a40cd035')
sha256sums=('58f5082025f3e97d9072dfe3fbd3abc43252ee118a7463209b65d05b8fd71741'
            '5dfd34c9a560da81f91d37b891e23761c74659fe36e04ab2a46696562a9ed876'
            '3b21308e935d799b3ffb4a86c6e00ffa4cb9b3f72f52d58d51c66eb0574ae7d2'
            '6c7b2cce851378f2fc8f6b490ce098e9cf0038aa05da7099771c8be94620e6ca')
