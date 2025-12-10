# Maintainer: zyoung11 <zy3180250@163.com>
pkgname='bm-terminal-music-player'
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimalist terminal music player."
arch=('x86_64')
url="https://github.com/zyoung11/BM"
license=('MIT')
depends=('glibc' 'alsa-lib' 'dbus')
makedepends=('go' 'git')
optdepends=('pulseaudio: PulseAudio support'
            'libnotify: Desktop notifications support')
source=("$pkgname::git+https://github.com/zyoung11/BM.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  go mod tidy
  go build -trimpath -buildmode=pie -ldflags="-s -w -linkmode=external -extldflags=-Wl,-z,relro,-z,now" .
}

package() {
  cd "$pkgname"
  
  # Install binary
  install -Dm755 bm "$pkgdir/usr/bin/bm"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install default config
  install -Dm644 default_config.toml "$pkgdir/usr/share/$pkgname/default_config.toml"
  
  # Install default cover image
  install -Dm644 default.jpg "$pkgdir/usr/share/$pkgname/default.jpg"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README_CN.md "$pkgdir/usr/share/doc/$pkgname/README_CN.md"
}
