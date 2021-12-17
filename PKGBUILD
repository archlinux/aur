# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Shaw <puxx@mail.ustc.edu.cn>
# Contributor: Nick <iglu.sitar at gmail dot com>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=ipbt
pkgver=20211203.104f822
pkgrel=1
pkgdesc='A high-tech ttyrec player'
arch=('x86_64')
url="https://www.chiark.greenend.org.uk/~sgtatham/${pkgname}"
license=('MIT')
depends=('ncurses' 'perl')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('631ee26dce8d4906e52963bbd7b579c91e9902d0f28903d90415d20ea5b730ba'
            '022f7ef69806ca76aec68e7336b4fcffc37184e101159bb14a124ba0e136cc63')

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

