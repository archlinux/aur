# Maintainer : Antonio Orefice <xt7player@gmail.com>


pkgname=caled-git
pkgver=20150109
pkgrel=1
pkgdesc="caled is a visual editor for LUT calibration files, it uses dispwin to upload and download the LUTs"
arch=('any')
url="https://github.com/kokoko3k/caled"
license=('gpl')

depends=('gambas3-gb-image>=3.0.0' 
    'gambas3-runtime>=3.3.0'
	'gambas3-gb-qt4>=3.3.0'
	'gambas3-gb-form>=3.3.0'
	'gambas3-gb-image>=3.3.0'
	'argyllcms')

makedepends=('gambas3-devel' 'git')

_gitroot="https://github.com/kokoko3k/caled.git"

build() {
  cd $srcdir
  rm -R $srcdir/caled &>/dev/null || echo "No old repository found, proceding to git clone..."
  git clone --depth 1 $_gitroot || return 1

  cd $srcdir/caled

  gbc3 -e -a -g -t  -f public-module -f public-control || gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd caled
  install -d ${pkgdir}/usr/bin
  install -m755 caled.gambas ${pkgdir}/usr/bin/caled
#  install -D xt7-player-git.png ${pkgdir}/usr/share/pixmaps/xt7-player-git.png
#  install -D xt7-player-git.desktop ${pkgdir}/usr/share/applications/xt7-player-git.desktop
}

