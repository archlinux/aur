# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xindy.sty  
pkgver=1.1beta
pkgrel=3
pkgdesc="A small LaTeX package to use the xindy insdexing system"
url="http://xindy.sourceforge.net/html-mail-archive/msg00025.html"
arch=('any')
license=('custom')
depends=('texlive-core')
source=(xindy.ins xindy.dtx license)
md5sums=('f64d5cb43c1a1012ff11987a30f7ff16'
         '9d91d1fbe616f562b3da2e500daeef8a'
         '3af4ea17568fc731da6ffeecf646c236')

package() {
  for _suffix in sty drv toc aux pdf glo log
  do
    [[ -f ${_suffix} ]] && rm xindy.${_suffix}
  done
  install -d $pkgdir/usr/share/texmf/{tex/latex/xindy,doc/xindy}
  yes|latex xindy.ins 
  for _suffix in sty ins dtx
  do
    install -Dm644 xindy.${_suffix} \
      $pkgdir/usr/share/texmf/tex/latex/xindy/xindy.${_suffix}
  done
  latex xindy.drv
  latex xindy.drv
  latex xindy.drv
  install -Dm644 xindy.dvi \
    $pkgdir/usr/share/texmf/doc/xindy/xindy.sty.dvi
  install -Dm644 license $pkgdir/usr/share/licenses/$pkgname/license
}
