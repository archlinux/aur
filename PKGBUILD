# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Martin Panter <vadmium+aur@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=html-docs
pkgver=5.0
pkgrel=1
pkgdesc="Set of documentation for HTML5 including HTML4 documentation."
arch=('any')
url="http://www.w3.org/TR/html/"
license=('GPL')
makedepends=('wget')
options=('docs')
source=('http://www.w3.org/TR/html4/html40.tgz')
noextract=('html40.tgz')
md5sums=('1ed76627ba80816079649f67023ec7ab')

prepare(){
  cd ${srcdir}
  mkdir ${srcdir}/html4
  tar -xf html40.tgz -C "${srcdir}/html4"  
  wget -q --show-progress -np -nH --cut-dirs=1 -r \
    -k 'http://www.w3.org/TR/html/' || return 0
}

package(){
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/doc/html
  cp -a ${srcdir}/html4 ${pkgdir}/usr/share/doc/html/
  cp -a ${srcdir}/html/* ${pkgdir}/usr/share/doc/html/  
}
