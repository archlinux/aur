# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=thunder-mini
pkgver=2.2.1
pkgrel=0
pkgdesc="Xunlei Product Center provides free download services for the latest products of Xunlei."
arch=("i686" "x86_64")
url="https://dl.xunlei.com/"
license=('custom')
depends=('wine')
source=(
  "http://down.sandai.net/mini/ThunderMini_dl1.5.3.288.exe"
  "license.html::https://www.xunlei.com/xieyi/xl9.html"
  "file://run"
)

prepare() {
  cd "${srcdir}"
  7z x -y ThunderMini_dl1.5.3.288.exe
  rm ./Bin/UnInstallClean.exe
}

package() {

  # Copy files
  install -d "${pkgdir}/usr/share/$pkgname"
  cp -r "$srcdir/"{Bin,bho,Skin} "${pkgdir}/usr/share/$pkgname/"
  cp "$srcdir/\$WINDIR/system32/"* "${pkgdir}/usr/share/$pkgname/Bin/"
  find "${pkgdir}/usr/share/$pkgname/" -type d -exec chmod 755 {} \;
  
  # Run script
  install -Dm755 run "${pkgdir}/usr/share/$pkgname/run"
  
  # Install licenses
  install -Dm644 "license.html" "${pkgdir}/usr/share/licenses/$pkgname/license.html"
}

# vim:set ts=2 sw=2 et:
md5sums=('95118524fa7d7e457c7bed4abcb5bbfc'
         '381254665d06cdd2c9493a8892e32bc5'
         '3c57bb9d9375bf00c11230caaf12ed5f')
         