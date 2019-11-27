# Maintainer: PromAvtomatika <info@sigursys.com>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=spnxclient
pkgver=1.0.60.62
pkgrel=0
arch=('any')
pkgdesc="ACS Sphinx client module"
url="http://sigursys.com/download_current.php"
license=('custom')
source=("http://sigursys.com/dl/spnxclient_${pkgver}-${pkgrel}_all.deb"
        "spnx-client.desktop")
sha256sums=('759478554a932c34c1f29794094c94147c22637e0a2a6e77980ba87f8bd42272'
            '6ba598b7bac9667cf3520222f1b2201f2fb7f37b96ee9c6de7222bd6bf360552')

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/usr/share/sphinx
  cp -r usr/share/sphinx "${pkgdir}"/usr/share/
  mkdir -p ${pkgdir}/usr/lib
  M=`uname -m | sed "s/x86_64/amd64/"`
  ln -s "/usr/share/sphinx/gui/spnxreader/libspnxreader_${M}.so" "${pkgdir}/usr/lib/spnxreader.so"
  ln -s "/usr/share/sphinx/gui/lib/libguinative_${M}.so" "${pkgdir}/usr/lib/libguinative.so"
  install -Dm755 usr/bin/spnxclient "${pkgdir}/usr/bin/spnxclient"
  install -Dm644 spnx-client.desktop "${pkgdir}/usr/share/applications/spnx-client.desktop"
}
