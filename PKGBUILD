# Maintainer: somekool <somekool _ at _ gmail _ dot _com>

#srcgiturl=https://github.com/mathieujobin/enlightenment-13
pkgname=enlightenment-dr13
pkgver=v0.13.3
pkgrel=1
pkgdesc="Enlightenment BETA 0.13.3."
arch=('i686' 'x86_64')
url="http://enlightenment.org"
license=('GPLv2')
depends=('gcc8' 'imlib')
optdepends=()
makedepends=('git' 'scons' 'cmake' 'libxext' 'libpng' 'giflib' 'libjpeg')
source=("enl_BETA-0.13.3.tar.gz"::"http://www.somekool.net/HTML/smk2k3/stuff/enl_BETA-0.13.3.tar.gz" "enl-0.13-themes.tar.gz"::"http://www.somekool.net/HTML/smk2k3/stuff/enl-0.13-themes.tar.gz")
md5sums=('11c482bd9cd360ec6c7110629f1759f4' '817a338117d52505bb50cfb63a18a96a')

build() {
  cd ${srcdir}/enl-0.13.3
  sed -i 's/MAX_HEIGHT 1536/&\n#define VERSION "0.13.3"/' enlightenment.h
  gcc-8 -o e *.c -lImlib -lX11 -lXext -ltiff -ljpeg -lgif -lpng
  echo ======================== build completed ========================
}

package() {
  mkdir -p ${pkgdir}/usr/local/enlightenment/bin/
  mv ${srcdir}/enl-0.13.3/e ${pkgdir}/usr/local/enlightenment/bin/e-13.3
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

