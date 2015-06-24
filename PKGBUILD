# Contributor:  ranger <rangergr@archlinux.gr>
pkgname=pysmssend
pkgver=1.48
pkgrel=4
pkgdesc="Application for sending SMS over the Internet"
arch=('any')
url="http://pysmssend.silverarrow.org/"
license=('GPL3')
depends=('python2-pyqt4' 'python2-mechanize')
makedepends=('patch')
changelog=$pkgname.changelog
source=("http://pysmssend.silverarrow.org/files/${pkgname}-${pkgver}.tar.gz" \
        $pkgname-desktop.diff)

md5sums=('6f646a4267151bfae623895d9c12cdd2'                                                                    
         '605cff59b56682b9589e4af50bea0fdd') 

package(){
  cd "${srcdir}/"
  patch -Np0 -i "${srcdir}/$pkgname-desktop.diff"

  # python2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' pysmssend

  python2 setup.py  install --root ${pkgdir}

  install -d ${pkgdir}/usr/share/$pkgname
  install -D -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname" 
  install -D -m755 "pysmssendcmd" "${pkgdir}/usr/bin/pysmssendcmd" 
  install -D -m644 "Icons/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png" 
  install -D -m644 "$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"

  cp -R * ${pkgdir}/usr/share/$pkgname
  rm -rf ${pkgdir}/usr/share/pysmssend/{build,pysmssendmod} 
  rm ${pkgdir}/usr/share/pysmssend/{setup.py,pysmssend*,*.sh}
}
