# Maintainer: Volkan Gümüs <hallo@f1-computer.de>
# Contributor: SaultDon <sault.don gmail>
# Contributor: josepghbr <rafael.f.f1@gmail.com>

pkgname=java-jai-imageio
pkgver=1.1
pkgrel=3
pkgdesc="Container for JavaTM Advanced Imaging Image I/O Tools projects."
arch=(i686 x86_64)
  [ "${CARCH}" = 'i686' ]   && _arch='i586'
  [ "${CARCH}" = 'x86_64' ] && _arch='amd64'
url="https://java.net/projects/jai-imageio/"
license=('custom')
depends=('java-environment' 'glibc')
install=java-jai-imageio.install
_jaiimageio="jai_imageio-${pkgver/./_}"
source=(http://download.java.net/media/jai-imageio/builds/release/$pkgver/${_jaiimageio}-lib-linux-${_arch}.tar.gz
	jai-imageio.profile.csh
	jai-imageio.profile)
[ "${CARCH}" = 'i686' ] && md5sums=('8f467118068a7dfefbe1c22ab43a22f3')
[ "${CARCH}" = 'x86_64' ] && md5sums=('163a33949d92930372dd1f59702f791e')
md5sums=("${md5sums[@]}"
	 '81805b48a7bd2af07ad168a8f594f4b3'
	 'd48bee907e9f3f7649a340a2369caf73')

package() {
  cd "$srcdir/$_jaiimageio"

  msg "Installing user profiles..."
  install -D ${srcdir}/jai-imageio.profile \
    ${pkgdir}/etc/profile.d/jai-imageio.sh
  install -D ${srcdir}/jai-imageio.profile.csh \
    ${pkgdir}/etc/profile.d/jai-imageio.csh
    
  msg "Installing jre libs..."
  install -d ${pkgdir}/usr/lib/jvm/java-8-jdk/lib
  install -Dm644 lib/* \
    ${pkgdir}/usr/lib/jvm/java-8-jdk/lib
  
  msg "Installing licenses..."
  install -d $pkgdir/usr/share/licenses/$pkgname   
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname
}
