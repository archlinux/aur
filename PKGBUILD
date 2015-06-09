# Maintainer: Allen Choong <allen dot choong at gmail dot com>
pkgname=firefox-moonlight
pkgver=3.99.0.3
pkgrel=11
pkgdesc="Alternative Silverlight plugin for Firefox using Mono"
arch=('i686' 'x86_64')
url="http://www.go-mono.com/moonlight/download.aspx"
license=('LGPL')
depends=("firefox")
makedepends=('unzip')

if [ "$CARCH" = "i686" ] ; then
    march="i586"
	source=(novell-moonlight-${pkgver}-${march}.xpi::"https://docs.google.com/uc?authuser=0&id=0B0xVGvAbM6ZkanVKSm9adWlraVk&export=download")
	md5sums=('2f286c4b6988683df8e51dc3c9f7a180')
	sha256sums=('bf7e6b6f59044edc8956dca17383d3fd23beaca7a91788733fd54c99ba2d3764')
elif [ "$CARCH" = "x86_64" ] ; then
	march="x86_64"
	source=(novell-moonlight-${pkgver}-${march}.xpi::"https://docs.google.com/uc?authuser=0&id=0B0xVGvAbM6ZkcTN3b1R1NVI1SVE&export=download")
	md5sums=('0653dfbbd488bcebccf0a906f08465c1')
	sha256sums=('4d9736799072c5f29c3e4e9ffb9d4c070159d6a07dbd93a8f0ad3cacdc1f2e63')	
fi


package() {
  _ffver=`pacman -Q firefox | cut -f2 -d\ | cut -f1-2 -d.`
# depends=("firefox>=${_ffver}" "firefox<=${_ffver/0/99}")

  cd $srcdir
  rm -Rf META-INF
  local emid=moonlight@novell.com
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>*</em:maxVersion>#' install.rdf
  cp -R * $dstdir
  
  rm $dstdir/novell-moonlight-${pkgver}-${march}.xpi
}

