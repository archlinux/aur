# Maintainer: justforlxz <justforlxz@gmail.com>

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-wallpapers-git
sourcename=deepin-wallpapers
pkgver=1.7.16.r2.ga1bdfad
pkgrel=1
pkgdesc='Deepin Wallpapers'
arch=('any')
license=('GPL')
url="https://github.com/linuxdeepin/deepin-wallpapers"
makedepends=('git' 'deepin-api')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/deepin-wallpapers/")
provides=('deepin-wallpapers')
conflicts=('deepin-wallpapers')
sha512sums=('SKIP')

pkgver() {
    cd $sourcename
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcename
  for _pic in deepin/*; do
    make PICS=$_pic
  done
}

package() {
  cd $sourcename
  install -dm755 "$pkgdir"/usr/share/wallpapers
  cp -r deepin "$pkgdir"/usr/share/wallpapers/
  install -dm755 "$pkgdir"/var/cache
  cp -r image-blur "$pkgdir"/var/cache/
  # Suggested by upstream
  install -dm755 "$pkgdir"/usr/share/backgrounds/deepin
  ln -s ../../wallpapers/deepin/Hummingbird_by_Shu_Le.jpg "$pkgdir"/usr/share/backgrounds/deepin/desktop.jpg
  ln -s $(echo -n /usr/share/wallpapers/deepin/Hummingbird_by_Shu_Le.jpg | md5sum | cut -d " " -f 1).jpg \
        "$pkgdir"/var/cache/image-blur/$(echo -n /usr/share/backgrounds/deepin/desktop.jpg | md5sum | cut -d " " -f 1).jpg
}
