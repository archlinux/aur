# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=m3u8down-git
binname=m3u8down
pkgver=r14.de4d0bc
pkgrel=1
pkgdesc="m3u8 down load to mp4 in cli"
url="https://github.com/DreamMaoMao/m3u8down"
arch=("x86_64")
license=("MIT")
depends=(
  "ffmpeg"
)

makedepends=(
  git
  go
)

provides=(m3u8down)
conflicts=(m3u8down)
source=("$pkgname::git+https://github.com/DreamMaoMao/m3u8down.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    git checkout master
}

build() {  
  cd $pkgname
  go get github.com/http-live-streaming/m3u8-downloader/dl
  go get github.com/u2takey/ffmpeg-go
  go build -o $binname
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/${binname}" "${pkgdir}/usr/bin/${binname}"
}

