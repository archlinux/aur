# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=liketaskmanager-git
pkgver=2.3.r1.g3e06229
pkgrel=1
pkgdesc="Tool that mimics the permformance monitoring of Windows Task Manager"
arch=('x86_64')
url="https://github.com/rejuce/LikeTaskManager"
license=('GPL-3.0-or-later')
depends=('qwt' 'nethogs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/rejuce/LikeTaskManager.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'fc8e72a0f140fdffe8f44e375418c9f03814251e3d67e797c45cad703be458ab')

pkgver() {
  cd LikeTaskManager
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd LikeTaskManager
  sed -i 's/lqwt-qt5/lqwt/g' LikeTaskManager.pro
}

build() {
  cd LikeTaskManager
  qmake-qt5
#  qmake-qt5 -o Makefile LikeTaskManager.pro -spec linux-g++ CONFIG+=qtquickcompiler
  make
}

package() {
 cd LikeTaskManager
  install -Dm755 LikeTaskManager "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
