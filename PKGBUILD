# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Shaw <puxx@mail.ustc.edu.cn>
# Contributor: Nick <iglu.sitar at gmail dot com>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=ipbt
pkgver=20220403.d4e7fcd
pkgrel=1
pkgdesc='A high-tech ttyrec player'
arch=('x86_64')
url="https://www.chiark.greenend.org.uk/~sgtatham/${pkgname}"
license=('MIT')
depends=('ncurses' 'perl')
makedepends=('cmake')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('8c7f325166b86055232cca9d745c6a18dcdcb6d30a0685e07ac0eab677912b05'
            '2bb881b4f15034d14d498ffe222394c004a5f3e3868e1014ed664daa08bfc402')

prepare() {
  patch -p0 -i ../${pkgname}.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr . 
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 ipbt "${pkgdir}/usr/bin/ipbt"
  install -Dm755 ttydump "${pkgdir}/usr/bin/ttydump"
  install -Dm755 ttygrep "${pkgdir}/usr/bin/ttygrep"
  install -Dm644 ipbt.1 "${pkgdir}/usr/share/man/man1/ipbt.1"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}

