pkgname=gog-7-billion-humans
pkgver=1.0.32487.23774
pkgrel=1
_gamename=${pkgname#gog-}
_gamename_=${_gamename//-/_}
_gamever=${pkgver//\./_}

pkgdesc="Automate swarms of office workers to solve puzzles inside your very own parallel computer made of people."
arch=("x86_64")
url="https://www.gog.com/game/${_gamename_}"
license=("custom")
groups=("games")
source=("gog_${_gamename_}_${_gamever}.tar.xz::gogdownloader://${_gamename_}/en3installer0" ${pkgname}.desktop)
md5sums=('3d42952a6b9329f1c64bda00b05c4afb' 'e4fea045bc42fe460f84265499cfa764')
# Register lgogdownloader as a download agent
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

depends=("openal" "sdl2")
makedepends=("lgogdownloader>=2.25")

prepare() {
  sed -i "s,CURRENT_DIR=.*,CURRENT_DIR=/opt/${pkgname},g" ${srcdir}/data/noarch/start.sh
}

package() {
  install -Dm 644 ${srcdir}/data/noarch/docs/End\ User\ License\ Agreement.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -dm 755 ${pkgdir}/opt
  cp -r ${srcdir}/data/noarch ${pkgdir}/opt/${pkgname}

  install -dm 755 ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/start.sh ${pkgdir}/usr/bin/${pkgname}

  install -Dm 644 ${srcdir}/data/noarch/support/icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
