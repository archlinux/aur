# Maintainer: Kitteh <namedkitten@gmail.com>
pkgname=kittehplayer-git
reponame=KittehPlayer
pkgver=1
pkgrel=1
epoch=
pkgdesc="A Qt Video Player with many themes for YouTube, Niconico and RoosterTeeth"
arch=("any")
url=""
license=('MPL2')
groups=()
depends=(qt5-svg qt5-declarative qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects mpv)
makedepends=(git cmake)
optdepends=('ffmpegthumbnailer: playlist thumbnails support'
            'youtube-dl: for sites like YouTube and Dailymotion')
source=("git+https://github.com/NamedKitten/KittehPlayer")
md5sums=("SKIP")

pkgver() {
cat ${reponame}/version
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
