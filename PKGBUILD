# Maintainer: McModder <mcmodder@mcmodder.ru>

pkgname=openttd-svn
pkgver=r27849
pkgrel=1
pkgdesc='An engine for running Transport Tycoon Deluxe (latest SVN build)'
arch=('i686' 'x86_64')
url='http://openttd.org'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
optdepends=('openttd-opengfx: free graphics' 
            'openttd-opensfx: free soundset')
makedepends=('svn')

source=("$pkgname::svn+svn://svn.openttd.org/trunk")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  local ver=$(svnversion)
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${pkgname}

 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD-latest" \
    --personal-dir=${pkgname}  

  make
}

package() {
  cd ${pkgname}

  make install
}
