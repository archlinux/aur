# Maintainer: Ludovico de Nittis <aasonykk [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=dbmain
pkgver=9.2.0
pkgrel=2
pkgdesc="A free data-modeling and data-architecture tool"
arch=(i686 x86_64)
url=http://www.db-main.eu/
license=(custom)
depends=(java-environment coreutils)
if test "$CARCH" == 'i686'; then
  depends+=(sdl)
  depends+=(libjpeg6-turbo)
  depends+=(gtk2)
  depends+=(libpng12)
  depends+=(libsm)
  depends+=(alsa-lib)
  depends+=(libtiff4)
  depends+=(libxtst)
fi
if test "$CARCH" == 'x86_64'; then
  depends+=(lib32-sdl)
  depends+=(lib32-libjpeg6-turbo)
  depends+=(lib32-gtk2)
  depends+=(lib32-libpng12)
  depends+=(lib32-libsm)
  depends+=(lib32-alsa-lib)
  depends+=(lib32-libtiff4)
  depends+=(lib32-libxtst)
fi
provides=(dbmain)
source=("http://intranet.rever.eu/DISTRIBUTION/DB-MAIN/dbm-${pkgver//.}-linux-setup.tar.gz"
        $pkgname.sh
        $pkgname.desktop
        $pkgname.png)
md5sums=('4cabf077d9989378de9024f3b320a9e9'
         '41cb50cf6a2a72cfc0b632d690726223'
         'd19295f8f8430c66157722d450149b93'
         '6bb248b5807368118996f3f5ad2edb68')

package(){
  cd "${srcdir}"

  # Actual program
  install -d "${pkgdir}/opt/dbmain/"
  cp -r bin doc examples java plugins License.txt readme.html "${pkgdir}/opt/dbmain/"

  # Launch script
  install -d "${pkgdir}/usr/bin/"
  install -Dm644 "bin/libdbmfunc.so" "${pkgdir}/opt/dbmain/bin"
  install -Dm644 "bin/libjidbm.so" "${pkgdir}/opt/dbmain/bin"
  install -Dm644 "bin/libextr_ids.so" "${pkgdir}/opt/dbmain/bin"
  install -Dm644 "bin/libextr_cob.so" "${pkgdir}/opt/dbmain/bin"
  install -Dm644 "bin/libextr_ims.so" "${pkgdir}/opt/dbmain/bin"
  install -Dm644 "bin/libextr_pl1.so" "${pkgdir}/opt/dbmain/bin"
  install -Dm644 "$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -m755 dbmain.sh "${pkgdir}/usr/bin/dbmain"

  # LICENSE file
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
