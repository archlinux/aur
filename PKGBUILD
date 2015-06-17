# Maintainer: M0Rf30

pkgname=rosa-media-player-plugin
pkgver=1.0
pkgrel=2
pkgdesc="The new multimedia player(based on SMPlayer) with clean and elegant UI (mozilla plugin only)."
arch=(i686 x86_64)
url=http://www.rosalab.ru/blogs/rosa-media-player-10-beta
license=(GPL)
depends=('mplayer' 'qt4')
source=("http://file-store.rosalinux.ru/download/24ab538782cffdb15e17a95cce32ba1aa7df0cd9")

build()
{
  cd "${srcdir}"

  qmake-qt4 rosa-media-player-plugin.pro
  make

  cd rosamp-plugin

  for pro in *.pro; do
	qmake-qt4 ${pro}
	make
  done

  lrelease-qt4 rosamp-plugin-qt.pro
}

package()
{
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/mozilla/plugins/translations/"

  cp -f romp/rosa-media-player/build/*.so "${pkgdir}/usr/lib/"
  cp -f rosamp-plugin/build/*.so "${pkgdir}/usr/lib/mozilla/plugins/"
  cp -f rosamp-plugin/translations/*.qm "${pkgdir}/usr/lib/mozilla/plugins/translations/"
}

md5sums=('258928a989192d9abb92030cb1b998b0')
