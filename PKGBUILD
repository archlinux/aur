# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi (Canmi21)

pkgname=cursor-free-vip-git
pkgver=1.9.02
pkgrel=1
pkgdesc="Reset Cursor AI MachineID & Auto Sign Up / In & Bypass Higher Token Limit"
arch=('x86_64')
url="https://github.com/yeongpin/cursor-free-vip"
license=('MIT')
depends=('python' 'cursor')
makedepends=('git' 'python' 'pyinstaller' 'uv')
provides=('cursor-free-vip')
source=("cursor-free-vip::git+https://github.com/yeongpin/cursor-free-vip.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cursor-free-vip"
  git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/cursor-free-vip"
  uv pip install -r requirements.txt
  pyinstaller --clean --noconfirm --onefile cursor.py --name cursor-free-vip
}

package() {
  install -Dm755 "$srcdir/cursor-free-vip/dist/cursor-free-vip" "$pkgdir/usr/bin/cursor-free-vip"
}