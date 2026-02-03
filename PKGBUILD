pkgname=foxy-jumpscare
pkgver=1.0
pkgrel=5
pkgdesc="A rare 1-in-10000 Foxy jumpscare (rolls every second in background)"
arch=('x86_64')
depends=('sdl2' 'ffmpeg')
makedepends=('xxd' 'gcc')
source=("main.cpp" "foxy.mp4" "foxy-jumpscare.service")
sha256sums=('c8cff5ef5caf401640170207fc8b8493c89cc2bdb6642031aeea5daa018cebeb'
            '9e6e4fdc40a077db281acbdf9420024977dfa49e5da2a951abb8c6764c938813'
            'e46261bdb38dd0d7eb3a49330300b155cb50898db1d86a331f3629140f02ac43')

build() {
  cd "$srcdir"
  xxd -i foxy.mp4 > video_data.h
  g++ -O3 main.cpp -o foxy_scare -lSDL2 -lavformat -lavcodec -lavutil -lswscale -lswresample
}

package() {
  install -Dm755 "$srcdir/foxy_scare" "$pkgdir/usr/bin/foxy_scare"
  install -Dm644 "$srcdir/foxy-jumpscare.service" "$pkgdir/usr/lib/systemd/user/foxy-jumpscare.service"
}
