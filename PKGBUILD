# Contributor: paul2lv [at] gmail dot com
# Maintainer: 

pkgname=foldingathome
pkgver=7.4.4
pkgrel=2
pkgdesc="Folding@Home is a distributed computing project which studies protein folding, misfolding, aggregation, and related diseases."
arch=('i686' 'x86_64')
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('glibc')
optdepends=('opencl-nvidia: for folding with an nVidia GPU')
replaces=('foldingathome-v7')
conflicts=('foldingathome-v7')
install=foldingathome.install

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

[ "$CARCH" = "i686" ] &&_source_arch="32bit"
[ "$CARCH" = "x86_64" ] && _source_arch="64bit"

if [ "$CARCH" = "i686" ]; then
    
source=(https://fah-web.stanford.edu/file-releases/public/release/fahclient/debian-testing-32bit/v7.4/fahclient_7.4.4-32bit-release.tar.bz2 
foldingathome.service)
    md5sums=('cfc23aeb72efed82289b53a055618dfc' 'dd55dbae3fbe56f90bed0e40f2b0de3c')
     
elif [ "$CARCH" = "x86_64" ]; then
    
source=(https://fah-web.stanford.edu/file-releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4-64bit-release.tar.bz2 
foldingathome.service)
    md5sums=('3a068d236d3a508a2a98a4a161fa14e2' 'dd55dbae3fbe56f90bed0e40f2b0de3c')
fi


package() {
  cd ${srcdir}

  install -D -c -m755 fahclient_${pkgver}-${_source_arch}-release/FAHClient ${pkgdir}/opt/fah/FAHClient
  install -D -c -m755 fahclient_${pkgver}-${_source_arch}-release/FAHCoreWrapper ${pkgdir}/opt/fah/FAHCoreWrapper
  install -D -c -m755 fahclient_${pkgver}-${_source_arch}-release/sample-config.xml ${pkgdir}/opt/fah/sample-config.xml

  chmod 755 ${pkgdir}/opt/fah/FAHClient
  chmod 755 ${pkgdir}/opt/fah/FAHCoreWrapper
  install -D -m644 fahclient_${pkgver}-${_source_arch}-release/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
  install -D -m644 fahclient_${pkgver}-${_source_arch}-release/README ${pkgdir}/opt/fah/README
  install -D -m644 fahclient_${pkgver}-${_source_arch}-release/ChangeLog ${pkgdir}/opt/fah/ChangeLog
  install -D -m644 ${srcdir}/foldingathome.service ${pkgdir}/usr/lib/systemd/system/foldingathome.service
}

