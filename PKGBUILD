# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-caffeine-plugin
pkgname=${_pkgname}-git
pkgver=r72.611c300
pkgrel=1
pkgdesc="Xfce panel plugin that keeps your screen from locking/sleeping."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
_url='https://github.com/Alperen42v/extra-xfce4-plugins'
url='https://github.com/Alperen42v/extra-xfce4-plugins/tree/main/caffeine-plugin'
license=('GPL-3.0-or-later')
depends=('xfce4-panel')
makedepends=('git')
provides=("${_pkgname}")
conflicts=(${_pkgname})
source=(git+${_url}
        'Makefile.patch'
        'xfce4panel-includes.patch')
sha512sums=('SKIP'
            '5fdfe5d42711fddc699e39c4e6e30d7016c161fed7f51c4705eff0a7b0ab87e10895596bafb23e799e62efb3fd7e4831274661fdf88e1c96abb6b567c82506ec'
            'dc25a616c28c5ab9e52f06295ddeae0a8e686f6ce97b293311b46bed703d5b902cee82c44115039846032259d09f2401697e0f9e67637d35a43b31746370c25c')

pkgver() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  printf 'r%s.%s' "$( git rev-list --count HEAD )" "$( git rev-parse --short HEAD )"
}

prepare() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  patch -uNp2 -r- -i "${srcdir}"/Makefile.patch
  patch -uNp2 -r- -i "${srcdir}"/xfce4panel-includes.patch
}

build() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  make
}

package() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  make DESTDIR="${pkgdir}" install
}
