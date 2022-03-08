# Maintainer: basxto <archlinux basxto de>
pkgname='asxxxx'
_pkgverbase='5.40'
_sourcebase='https://shop-pdp.net/_ftp/asxxxx/'
pkgver=${_pkgverbase}u05
pkgrel=2
pkgdesc='Series of microprocessor cross assemblers for Z80, 6502, 8080, 6800, 1802 and many more'
url='https://shop-pdp.net/ashtml/asxxxx.php'
license=('GPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('unzip')
source=("${_sourcebase}asxs$(echo ${_pkgverbase}|tr . p).zip" "${_sourcebase}u02$(echo ${_pkgverbase}|tr -d .).zip" "${_sourcebase}u03$(echo ${_pkgverbase}|tr -d .).zip" "${_sourcebase}u04$(echo ${_pkgverbase}|tr -d .).zip" "${_sourcebase}u05$(echo ${_pkgverbase}|tr -d .).zip")
noextract=("asxs$(echo ${_pkgverbase}|tr . p).zip" "u02$(echo ${_pkgverbase}|tr -d .).zip" "u03$(echo ${_pkgverbase}|tr -d .).zip" "u04$(echo ${_pkgverbase}|tr -d .).zip" "u05$(echo ${_pkgverbase}|tr -d .).zip")
sha256sums=('ac8277b85308b9fdc3e27c50557cc3ba45fe0de85ddc96c936fb25e5fd3a3e22'
            '8a9187bf04ae5464549bd74e183a2c9bab49c47dba889e8ae8280450537e3455'
            '917bb75ad79766bc6162d90a1b3326cc69c3e4dac8aa975cdc8fcf46dc3fcf05'
            '21c0a84dd08651a7d7bfe84cbcc5555a3babd0e56595d89840d3317255dc7dfc'
            '156b9d7c1acbd80019ceabc028ac8cb12a56033022bdbb01befa308a289e2ed9')

prepare() {
  # convert to unix as described in readme
  for update in ${noextract[@]}; do
    unzip -L -a -u -o ${update}
  done
}

build() {
  cd "${srcdir}/asxv$(echo $pkgver | fold -w1 | head -n 1)pxx/asxmak/linux/build/"
  make
}


package() {
  cd "${srcdir}/asxv$(echo $pkgver | fold -w1 | head -n 1)pxx/"
  install -d "${pkgdir}/usr/bin/"
  install -Dm755 asxmak/linux/exe/as* asxmak/linux/exe/s19os9 "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/asxhtml/"
  install -Dm644 asxhtml/* "${pkgdir}/usr/share/${pkgname}/asxhtml/"
  install -Dm644 readme.txt changes.txt "${pkgdir}/usr/share/${pkgname}/"
}
