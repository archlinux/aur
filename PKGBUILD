# Contributor: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=frogatto-git
pkgver=r1.8236da3
pkgrel=1
pkgdesc="An action-adventure game, starring a certain quixotic frog."
arch=(any)
url="http://www.frogatto.com/"
license=('custom')
depends=('anura')
provides=('frogatto')
conflicts=('frogatto')
makedepends=('git')
source=("git+https://github.com/frogatto/frogatto.git"
        "frogatto-git.sh"
        "frogatto-git.desktop")
sha256sums=('SKIP'
            '40ede9bcffadf4c235d80835029466d851d976bf1aeccbaa065e41e55431ba29'
            '873fd89f9fab64fdb3879f5bf8eae0a6e1b4046c891f3a4dac7702a21938a780')

_gitname=frogatto

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -DT -m755 frogatto-git.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 frogatto-git.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  cd $_gitname
  # the LICENSE file is currently missing in the repository
  # install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  _installdir=$pkgdir/usr/share/anura-git/modules/frogatto
  install -DT -m644 module.cfg $_installdir/module.cfg
  install -DT -m644 master-config.cfg $_installdir/master-config.cfg
  rm -rf music/Unused sounds/unused images/os/mac
  cp -r data images locale music sounds $_installdir
}
