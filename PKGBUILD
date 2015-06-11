# Maintainer: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Sebastien <sebcactus@gmail.com>

pkgname=sptk
pkgver=3.7
pkgrel=1
pkgdesc="A suite of speech signal processing tools."
arch=('i686' 'x86_64')
url="http://sp-tk.sourceforge.net/"
license=('BSD')
depends=('glibc')
optdepends=('libx11: for XY-plotter' 'tcsh: for helper scripts')
source=(http://downloads.sourceforge.net/sp-tk/SPTK-$pkgver.tar.gz ${pkgname}.sh)

build()
{
  cd "${srcdir}/SPTK-$pkgver"
  ./configure --prefix=/opt/$pkgname
  make
}

package()
{
  cd "${srcdir}/SPTK-$pkgver"
  make prefix="${pkgdir}/opt/$pkgname" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -D -m755 ../${pkgname}.sh "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
sha256sums=('afc4b309f5911010f1a37cbb307f4637f93b4aa141bdc915813913426b1513af'
            'b5afaf60414297bd359f73dbe14ae2a3608f9c52301cc5801c9708ceb710d416')
