# Maintainer: cap153 <1536989047@qq.com>

pkgname=easytier-bin
pkgver=2.4.5
pkgrel=1
pkgdesc="由Rust和Tokio驱动，一个简单、安全、去中心化的内网穿透VPN组网方案"
conflicts=("easytier" "easytier-git" "easytier-web" "easytier-core" "easytier-cli" "easytier-web-git" "easytier-core-git" "easytier-cli-git")
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('Apache License 2.0')
source=("easytier-example.service")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/EasyTier/EasyTier/releases/download/v$pkgver/easytier-linux-x86_64-v$pkgver.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/EasyTier/EasyTier/releases/download/v$pkgver/easytier-linux-aarch64-v$pkgver.zip")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
options=('!strip')
install='easytier-bin.install'

prepare() {
  cd "$srcdir" || exit 1
  if [ "$CARCH" == "x86_64" ]; then
    bsdtar -xf "$pkgname-$pkgver-x86_64.zip" --strip-components=1
  elif [ "$CARCH" == "aarch64" ]; then
    bsdtar -xf "$pkgname-$pkgver-aarch64.zip" --strip-components=1
  fi
}

package() {
  cd "$srcdir" || exit 1
	install -Dm644 easytier-example.service -t "$pkgdir/etc/systemd/system"
  install -Dm755 easytier-core "$pkgdir/usr/bin/easytier-core"
  install -Dm755 easytier-cli "$pkgdir/usr/bin/easytier-cli"
  install -Dm755 easytier-web "$pkgdir/usr/bin/easytier-web"
  install -Dm755 easytier-web-embed "$pkgdir/usr/bin/easytier-web-embed"
}
# makepkg --printsrcinfo > .SRCINFO
