# Maintainer: Cross Nastasi <cross@dill.moe>

pkgname=mineclone2-git-dill
pkgver=r12018.a3db7bd50
pkgrel=1
pkgdesc="Voxel-based sandbox game for Minetest. This package has been modified to work with the minetest-git-dill package."
arch=(any)
url=https://github.com/MineClone2/MineClone2
license=(GPL3)
depends=(minetest-git-dill git)
source=(git+"${url}".git)
md5sums=('SKIP')
install=installfile

pkgver() {
  cd "${srcdir}/MineClone2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir/usr/share/minetest/games"
    cp -r MineClone2 "$pkgdir/usr/share/minetest/games/mineclone2"
    if ! grep -q 'MINETEST_GAME_PATH' /etc/profile; then
        echo 'export MINETEST_GAME_PATH=/usr/share/minetest/games' | sudo tee -a /etc/profile
    fi
}
