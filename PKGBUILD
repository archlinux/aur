# Maintainer: somekool <somekool _ at _ gmail _ dot _com>

pkgname=enlightenment-dr13
pkgver=v0.13.3
pkgrel=20230302
pkgdesc="Enlightenment BETA 0.13.3."
arch=('i686' 'x86_64')
url="http://enlightenment.org"
license=('GPLv2')
depends=('imlib')
optdepends=()
makedepends=('git' 'scons' 'cmake' 'libxext' 'libpng' 'giflib' 'libjpeg')
source=("${pkgver}-${pkgrel}.tar.gz"::"https://github.com/mathieujobin/enlightenment-13/archive/refs/tags/${pkgver}-${pkgrel}.tar.gz" "enl-0.13-themes.tar.gz"::"http://www.somekool.net/HTML/smk2k3/stuff/enl-0.13-themes.tar.gz")
md5sums=('91b757e066c61def2f581f188ea1fcf3' '817a338117d52505bb50cfb63a18a96a')

build() {
  cd ${srcdir}/enlightenment-13-${pkgver:1}-${pkgrel}
  gcc -w -o e13 *.c -lImlib -lX11 -lXext -ltiff -ljpeg -lgif -lpng
  echo ======================== build completed ========================
}

package() {
  ls ${srcdir}
  mkdir -p ${pkgdir}/usr/local/enlightenment/bin/
  mv ${srcdir}/enlightenment-13-${pkgver:1}-${pkgrel}/e13 ${pkgdir}/usr/local/enlightenment/bin/e-13.3
  mkdir -p ${pkgdir}/usr/local/enlightenment/themes/
  mv ${srcdir}/enl-0.13-themes/[DE]* ${pkgdir}/usr/local/enlightenment/themes/
  mkdir -p ${pkgdir}/usr/share/xsessions/
  cat << EOF > ${pkgdir}/usr/share/xsessions/e13.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Enlightenment DR13.3
Comment=Enlightenment BETA 0.13.3 (02/15/98)
Exec=/usr/local/enlightenment/bin/e-13.3
Icon=e
Type=Application

EOF

  echo ======================== package completed ========================
}

