# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=mediadownloader-git
pkgver=4.3.1.r7.g0ab258d
pkgrel=1
pkgdesc="This project is a Qt/C++ based GUI frontend to CLI multiple CLI based tools that deal with downloading online media."
arch=('x86_64' 'aarch64')
url="https://github.com/mhogomchungu/media-downloader"
license=('GPL')
sha512sums=("SKIP"
           "114e167464acf31269d2b5c3ffd1742bc231b4cbcf5fc885b8716081deba249174b7afaecf0a7316ed35b508da03207191a33608de8b3f89f2a70d311001f821")
source=("git+https://github.com/mhogomchungu/media-downloader.git"
        "mediadownloader.desktop")
conflicts=("mediadownloader"
           "mediadownloader-bin")
provides=("mediadownloader"
          "mediadownloader-bin")
makedepends=("gcc"
             "cmake"
             "qt5-base"
             "qt5-tools")
optdepends=("yt-dlp: for downloading youtube videos"
            "gallery-dl: for downloading instagram media"
            "wget: for downloading regular files off the internet"
            "aria2: for downloading large files off the internet")

pkgver() {
    cd "media-downloader"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "media-downloader"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..
}

build() {
	pwd
	cd "media-downloader/build"
	make -j$(nproc)
}

package() {
	cd "media-downloader/build"
	env "DESTDIR=$pkgdir" cmake -P cmake_install.cmake
}
