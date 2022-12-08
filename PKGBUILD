# Maintainer: justforlxz <justforlxz@gmail.com>

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-wallpapers-git
pkgver=1.8.3.r10.g548f259
pkgrel=1
pkgdesc='Deepin Wallpapers'
arch=('any')
license=('GPL')
url="https://github.com/linuxdeepin/deepin-wallpapers"
makedepends=('git' 'deepin-api-git')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-wallpapers/")
provides=('deepin-wallpapers')
conflicts=('deepin-wallpapers')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  for _pic in deepin/*; do
    make PICS=$_pic
  done
}

package() {
  cd $pkgname
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
