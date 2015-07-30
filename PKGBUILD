# Maintainer: Familia < carlosfamilia at gmail dot com >
pkgname=rstudio-server-bin
pkgver=0.99.467
pkgrel=2
pkgdesc="A new integrated development environment (IDE) for R (binary version from RStudio official website)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r>=2.11.1' 'glibc>=2.7' 'libedit' 'psmisc')
conflicts=('rstudio-server' 'rstudio-server-git')
provides=("rstudio-server=${pkgver}")
#options=(!strip)

_x86md5=3696d6252701d4da7f94d6b68afc5d03
_x64md5=0dd6514ea6a997b9eb11d4d948aa87de
_rsservice=eea28f7865720f6c8d5de12f3f631880
case "$CARCH" in
	'i686')
		_arch=i386
		md5sums=($_x86md5 $_rsservice)
		;;
	'x86_64')
		_arch=amd64
		md5sums=($_x64md5 $_rsservice)
		;;
esac    
source=("https://download2.rstudio.org/rstudio-server-${pkgver}-${_arch}.deb"
	"rstudio-server.service")

install="$pkgname".install

package() {
  msg "Converting debian package..."
  
  cd "$srcdir"
  tar zxpf data.tar.gz -C "$pkgdir"
  chmod 755 $(find $pkgdir/usr -type d)

  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -d "${pkgdir}/etc/rstudio"
  install -m644 -D "rstudio-server.service" "${pkgdir}/etc/systemd/system/rstudio-server.service"
  
  
}
# vim:ft=sh tabstop=2 expandtab
