# Maintainer: cap153 <1536989047@qq.com>

pkgname=rrwm-bin
_pkgname=rrwm
pkgver=0.1.3
pkgrel=1
pkgdesc="A tiling window manager developed in Rust for River, using cosmic/bspwm layout"
arch=('x86_64')
url="https://github.com/cap153/rrwm"
license=('MIT')
depends=('river')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')

source=(
  "rrwm.desktop"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/cap153/rrwm/v$pkgver/LICENSE"
)
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::https://github.com/cap153/rrwm/releases/download/v$pkgver/rrwm"
)

# 这里的值你可以运行 `updpkgsums` 自动生成覆盖
sha256sums=('b47bce7fb7c35700d37c9df7f2dcd989acf8d56282acffa6a5d37aa1a64f8030'
            '26bc02acb6900eefb9bacdda0830b61b60f354c7b8e3b47a2f01a0c512eaeb39')
sha256sums_x86_64=('ea2651a3125c5458df232672284d15e0cbe7d4da45ab806465d4cea0603a9834')

package() {
  # 安装可执行文件
  install -Dm755 "$srcdir/$_pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/$_pkgname"

  # 安装 Wayland 会话桌面入口
  install -Dm644 "$srcdir/rrwm.desktop" "$pkgdir/usr/share/wayland-sessions/rrwm.desktop"

  # 安装 MIT 协议文件（规范必须）
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# makepkg --printsrcinfo > .SRCINFO
