# Maintainer: Kitteh <namedkitten@gmail.com>
pkgname=kittehplayer-git
reponame=KittehPlayer
pkgver=3.r7d916ea1df4aef90ef1c602b333cfed2497260ef
pkgrel=1
pkgdesc="A Qt Video Player with many themes for YouTube, Niconico and RoosterTeeth"
arch=("any")
url="https://github.com/NamedKitten/kittehplayer"
license=('MPL2')
depends=(qt5-svg qt5-declarative qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects mpv)
makedepends=(git cmake)
optdepends=('ffmpegthumbnailer: playlist thumbnails support'
            'youtube-dl: for sites like YouTube and Dailymotion')
source=("git+https://github.com/NamedKitten/KittehPlayer")
md5sums=("SKIP")

pkgver() {
  cd ${reponame}
  printf "%s.r%s" "$(cat version)" "$(git rev-parse HEAD)"
}

build() {
  if [  -d build ]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake ../${reponame} -DCMAKE_UNITY_BUILD=yes -DCMAKE_UNITY_BUILD_BATCH_SIZE=100 -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
