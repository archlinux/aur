# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=foldingathome-beta
pkgver=7.4.16
pkgrel=1
pkgdesc="Folding@Home is a distributed computing project which studies protein folding, misfolding, aggregation, and related diseases - beta version."
arch=('x86_64')
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('glibc')
optdepends=('opencl-nvidia: for folding with an nVidia GPU'
	'cuda: for folding with an nVidia GPU'	
	'opencl-mesa: for folding with an older AMD GPU'
	'opencl-amd: for folding with a newer AMD GPU')
conflicts=('foldingathome')
provides=('foldingathome=${pkgver}')
install=foldingathome.install
source=("https://folding.stanford.edu/releases/beta/release/fahclient/debian-stable-64bit/v7.4/fahclient_${pkgver}-64bit-release.tar.bz2"
"foldingathome.service")
sha256sums=('dade69e217697dd886a241c4400b9aaef0e16e66f510c33ddcde22cd098fec30'
            'ad1bb4f104bc3446db7bb91a7d199bfeda5d80e15e08fe17bc69de1c276e2010')

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

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

