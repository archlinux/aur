# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=taskell
pkgname="${_name}-bin"
pkgver=1.7.2
pkgrel=1
pkgdesc='A command line kanban board/task manager written in Haskell'
arch=('x86_64')
url="https://github.com/smallhadroncollider/${_name}"
license=('Custom')
options=('!strip' '!emptydirs')
conflicts=("${_name}")
replaces=("${_name}")
_pkgfile="${_name}-${pkgver}_x86-64-linux.deb"
depends=('ncurses')
makedepends=('binutils' 'tar')
source=(
  "${url}/releases/download/${pkgver}/${_pkgfile}"
  LICENSE
)
sha256sums=('765c4118c4558347685a1b4573b63797dec01bd1dc6982a4c186f5126a70e3cc'
            '04dc83953b60b17ab28cbc37ad3188e1c632db38dd423885af7507460f461d29')

package() {
  ar x ${_pkgfile}
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}

  # Move from /usr/local/bin to /usr/bin
  mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr"
  rmdir "${pkgdir}/usr/local"

  # Copy license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  # Ugly hack until taskell is been built with a more recent ncurses
  install -d "${pkgdir}"/usr/lib
  ln -s /usr/lib/libncursesw.so.6.1 "${pkgdir}/usr/lib/libtinfo.so.5"

  # install -Dm0755 taskell "${pkgdir}"/usr/bin/taskell
}

# vim:set ts=2 sw=2 et:
