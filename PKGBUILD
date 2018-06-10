# Contributor: paul2lv [at] gmail dot com
# Maintainer: 

pkgname=foldingathome
pkgver=7.5.1
pkgrel=1
pkgdesc="Folding@Home is a distributed computing project which studies protein folding, misfolding, aggregation, and related diseases."
arch=('x86_64')
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('glibc')
optdepends=('opencl-nvidia: for folding with an nVidia GPU'
	'cuda: for folding with an nVidia GPU'	
	'opencl-mesa: for folding with an older AMD GPU'
	'opencl-amd: for folding with a newer AMD GPU')
replaces=('foldingathome-v7')
conflicts=('foldingathome-v7')
install=foldingathome.install

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

source=(https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1-64bit-release.tar.bz2 
foldingathome.service)
    md5sums=('5353688a1c5cb0a226ce8e24b8ecb771' 'dd55dbae3fbe56f90bed0e40f2b0de3c')


package() {
  cd ${srcdir}

  install -D -c -m755 fahclient_${pkgver}-64bit-release/FAHClient ${pkgdir}/opt/fah/FAHClient
  install -D -c -m755 fahclient_${pkgver}-64bit-release/FAHCoreWrapper ${pkgdir}/opt/fah/FAHCoreWrapper
  install -D -c -m755 fahclient_${pkgver}-64bit-release/sample-config.xml ${pkgdir}/opt/fah/sample-config.xml

  chmod 755 ${pkgdir}/opt/fah/FAHClient
  chmod 755 ${pkgdir}/opt/fah/FAHCoreWrapper
  install -D -m644 fahclient_${pkgver}-64bit-release/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
  install -D -m644 fahclient_${pkgver}-64bit-release/README.md ${pkgdir}/opt/fah/README.md
  install -D -m644 fahclient_${pkgver}-64bit-release/CHANGELOG.md ${pkgdir}/opt/fah/CHANGELOG.md
  install -D -m644 ${srcdir}/foldingathome.service ${pkgdir}/usr/lib/systemd/system/foldingathome.service
}

