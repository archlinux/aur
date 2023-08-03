# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=libljacklm
pkgver=2017.03
pkgrel=1
pkgdesc="Linux high level LabJack U12 driver"
arch=('i686' 'x86_64')
url="http://labjack.com/support/u12/ljacklm"
license=('MIT')
depends=("labjack-exodriver")
provides=('ljacklm')
conflicts=('ljacklm')
source=("https://cdn.docsie.io/file/workspace_u4AEu22YJT50zKF8J/doc_VDWGWsJAhd453cYSI/boo_9BFzMKFachlhscG9Z/file_9ItAX6BbkHIbokp9m/ljacklm_2017_03_09.zip"
        "LICENSE")
md5sums=('6170eb78c9f8b5abf2529574c6ecaa42'
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
