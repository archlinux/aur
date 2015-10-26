# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# Contributor: jimmy-6 <jakub.jarozek at gmail dot com>

pkgname=cogs
pkgver=4
pkgrel=2
pkgdesc="A game in which you build machines from sliding tiles"
arch=('i686' 'x86_64')
url="http://www.cogsgame.com/"
license=('unknown')
depends=('gcc-libs' 'sdl<1.3' 'openal')
makedepends=('imagemagick')
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
source=(hib://cogs-installer-build${pkgver} cogs.desktop)
md5sums=('dbfb640b494ccaddd0d3553390720ad9'
         'a35a1fc9e81e3ab180cc2fe523e5ad43')

package() {
  cd $srcdir

  install -d ${pkgdir}/opt/cogs
  mv data/* ${pkgdir}/opt/cogs/

  rm -rf ${pkgdir}/opt/cogs/{x86,amd64}

  #Create launcher
  install -Dd ${pkgdir}/usr/bin
  echo \#\!/bin/bash > ${pkgdir}/usr/bin/cogs
  echo /opt/cogs/Cogs >> ${pkgdir}/usr/bin/cogs
  chmod +x ${pkgdir}/usr/bin/cogs

  if [ "${CARCH}" = "x86_64" ]; then
    rm -rf ${pkgdir}/opt/cogs/Cogs-x86
  else
    rm -rf ${pkgdir}/opt/cogs/Cogs-amd64
  fi

  for i in 16x16 22x22 32x32 48x48 64x64 128x128; do
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/${i}/apps
    convert -resize ${i} \
        ${pkgdir}/opt/cogs/cogs.png \
        ${pkgdir}/usr/share/icons/hicolor/${i}/apps/cogs.png
  done

  # install menu entry
  install -D ${srcdir}/cogs.desktop ${pkgdir}/usr/share/applications/cogs.desktop
}
