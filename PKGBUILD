# Contributer: giacomogiorgianni@gmail.com 

pkgname=backupto
_name=BackupTo
pkgver=1.0
pkgrel=7
pkgdesc="kde backup easy and fast"
arch=(686 x86_64)
url="https://www.opendesktop.org/p/1127666/startdownload?file_id=1535644393&file_name=BackupTo.zip&file_type=application/zip&file_size=315331"
license=('GPL')
depends=('qt4')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1MzU2NDQzOTMiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjM2YzYwMzc0NWFjMGEzNmQ5NWI1ZGZmM2ZjOTc4YTNlYzVlNDVhMDhjMTM0MzRkN2VmYWU4NGE5ZjQ2Y2YxMTMwZDFhNGZjMjc5ZTEzYWY0MjI1M2Q2YzRiNThhODA2MDYzNjczZjA5NTViY2QwOTgzY2QwZDQ3Y2I4YzI4MDYzIiwidCI6MTYyMTc4NzYwNywic3RmcCI6ImJjYzcyYzY3ZThkMzQ4MzY0Y2UxOGFkY2E3YTAwOGRkIiwic3RpcCI6IjIuNDEuMTIzLjIyMiJ9.vFBIpqqFBkoS-aFrAheAuwH8AW7pXc7APxNga-j7zqk/$_name.zip" "$_name.desktop")
md5sums=('b9860f769f3e021a7521fa41f9cfe3f6' '5c61b35ad59bb6fc74e3d01542d74f7a')

prepare() {
    cd "$srcdir/$_name"
    sed -i 's~QRect Rect= QApplication::screens()~// QRect Rect= QApplication::screens()~g' "qfmainwindow.cpp"
    sed -i 's~move(Rect.center()~// move(Rect.center()~g' "qfmainwindow.cpp" 
    sed -i 's~Simulation || QDPathSource.removeRecursively()~Simulation ~g' "qthsynchronize.cpp"
}

build() {
  cd "$srcdir/$_name"
  qmake-qt4 $_name.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/"
   make  
}

package() {
    cd "$srcdir/$_name"
  install -D -m755 $_name ${pkgdir}/usr/bin/$pkgname
  install -Dm644 $srcdir/$_name/$_name.png "$pkgdir/usr/share/pixmaps/qtcreator_logo.png"
  install -D -m644 ${srcdir}/$_name.desktop ${pkgdir}/usr/share/applications/$_name.desktop
  #make
  #make INSTALL_ROOT=${pkgdir} install
}
