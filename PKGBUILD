# Maintainer: vodka2 <vodka2vodka at rambler.ru>
pkgname=vk-music-fs-git
pkgrel=1
pkgver=r86.3b26469
pkgdesc="FUSE virtual file system for VK (VKontakte) audios"
url="https://github.com/vodka2/vk-music-fs"
arch=('x86_64')
license=('custom')
depends=('fuse' 'boost-libs' 'zlib' 'openssl')
makedepends=('git' 'cmake' 'boost')
source=("${pkgname}::git+https://github.com/vodka2/vk-music-fs.git#branch=master")
md5sums=(SKIP)
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  cmake --build . --target vk_music_fs
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "${srcdir}/${pkgname}/build/vk_music_fs" "$pkgdir/usr/bin"
}
