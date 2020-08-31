# Maintainer: Lumpy Zhu<lumpyzhu@aliyun.com>

pkgname=llvm-rc-bin
_pkgname=llvm
pkgver=11.0.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=2
pkgdesc="Collection of modular and reusable compiler and toolchain -PreRelease"

arch=('x86_64')
url="https://prereleases.llvm.org$pkgver"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs' 'zlib' 'ncurses5-compat-libs')
install=$pkgname.install
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver-rc$pkgrel/clang+llvm-$pkgver-rc$pkgrel-x86_64-linux-sles12.4.tar.xz"
	"llvm.sh")
sha256sums=('5d1a54fbca4e3c9865094c8c4602d5761adc49a1f4c58d2a481cbe502ea35f74'
	'4514139cb511ced2c5495988cc248d95552045888c1cb26bbedc7654fa2e7b91')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r clang+llvm-$pkgver-rc$pkgrel-x86_64-linux-sles12.4 "$pkgdir"/opt/$_pkgname/

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/opt/$_pkgname
}
