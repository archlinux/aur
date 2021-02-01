# Contributor: Guillaume ALAUX <Guillaume at ALAUX dot net>
# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=scrabble3d
pkgver=3.1.4_1
pkgrel=2
pkgdesc="Highly customizable Scrabble game (classic, SuperScrabble, 3D games)"
depends=(gtk2)
arch=('i686' 'x86_64')
url="http://scrabble.sourceforge.net/wiki/"
license=('GPL')

source_i686=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/Scrabble3D-i386.deb https://downloads.sourceforge.net/project/scrabble/Main_Program/Test/Test-Scrabble3D-i386.tar.gz)
source_x86_64=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/Scrabble3D-x86_64.deb https://downloads.sourceforge.net/project/scrabble/Main_Program/Test/Patch-Scrabble3D-x86_64.gz)


md5sums_i686=('3d5e1ae45fbdac02f9ba7ca6740cb5b8'
              '5106b203f7521295f1e0bcd9ff7d4c4c')
md5sums_x86_64=('406e6cb558c4f440f3db4aeae48b2149'
                'f76170fe0f2c0adba5f1fbd8bc2142fd')

package() {
  cd "${srcdir}"

  ar x Scrabble3D-*.deb
  tar xJf data.tar.xz -C ${pkgdir}
  chmod -R 755 ${pkgdir}/usr
  cd "${pkgdir}/usr/bin"
  if [ "${CARCH}" = "i686" ]
  then
    tar xf "${srcdir}/Test-Scrabble3D-i386.tar.gz"
  else
    gunzip -c "${srcdir}/Patch-Scrabble3D-x86_64.gz" >"${pkgdir}/usr/bin/Scrabble3D"
  fi
}
