# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=foldingathome-beta
pkgver=7.6.14
pkgrel=1
pkgdesc="Folding@Home is a distributed computing project which studies protein folding, misfolding, aggregation, and related diseases - beta version."
arch=('x86_64')
url="https://foldingathome.org/"
license=('CUSTOM')
depends=('glibc')
optdepends=('fahcontrol-beta: GUI for F@H'
            'fahviewer-beta: 3D simulation viewer for F@H'
            'opencl-icd-loader: for folding with a GPU'
            'opencl-driver: for folding with a GPU (choose Nvidia/AMD/Mesa package which matches your GPU)')
conflicts=('foldingathome' 'fahclient')
provides=('foldingathome' 'fahclient')
install=foldingathome.install
source=("https://download.foldingathome.org/releases/beta/release/fahclient/debian-stable-64bit/v7.6/fahclient_${pkgver}-64bit-release.tar.bz2"
        "foldingathome.service")
sha256sums=('e0d34c5408e3ba4487efe980993cc8a3cb6d5f937765fd30f01173a51d67ac55'
            'bbb437be4d7f2abfb135fe611535a45f6698051d11e7d9b74f4e50622992a4e2')

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

