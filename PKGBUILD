# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=libljacklm
pkgver=2013.05
pkgrel=1
pkgdesc="Linux high level LabJack U12 driver"
arch=('i686' 'x86_64')
url="http://labjack.com/support/u12/ljacklm"
license=('MIT')
depends=("labjack-exodriver")
provides=('ljacklm')
conflicts=('ljacklm')
source=("http://labjack.com/sites/default/files/2013/05/ljacklm.zip"
        "LICENSE")
md5sums=('3fd8a47d058854d722ab24cd7a17d031'
         '6b654d05134aa959b7db1f4b05c7f33d')

build() {
  cd "${srcdir}"/ljacklm/"${pkgname}"
  sed -i -e 's:/usr/local/:/usr/:g' Makefile
  make
  ln -s libljacklm.so.* libljacklm.so

}

package() {
  cd "$srcdir/ljacklm/"
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include
  mkdir -p ${pkgdir}/usr/share/doc/libljacklm
  install -D -m755 ${pkgname}/libljacklm.so.* ${pkgdir}/usr/lib/
  cp -dpr --no-preserve=ownership \
    libljacklm/libljacklm.so ${pkgdir}/usr/lib/libljacklm.so
  install -D -m644 libljacklm/ljacklm.h ${pkgdir}/usr/include/
  install -D -m644 ../LICENSE \
    ${pkgdir}/usr/share/licenses/libljacklm/LICENSE
  cp -dpr --no-preserve=ownership \
    examples ${pkgdir}/usr/share/doc/libljacklm
}

# vim:set ts=2 sw=2 et:
