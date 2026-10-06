# Maintainer: Rutger Pronk <rutger.pronk11@gmail.com>
pkgname=useful-autoclicker-git
_pkgname=useful-autoclicker
pkgver=2.2.r0.gb27f8e8
pkgrel=1
pkgdesc="A versatile autoclicker with hotkey toggle, randomized timings and click-on-hold"
arch=('x86_64' 'aarch64')
url="https://github.com/Rutger505/Useful-Autoclicker"
license=('MIT' 'LGPL-3.0-or-later')
depends=('java-runtime>=17' 'libx11' 'libxtst' 'libxt' 'libxinerama' 'libxkbcommon-x11')
makedepends=('git' 'java-environment>=17')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./build.sh
}

package() {
  cd "$_pkgname"
  install -Dm644 out/Useful-Autoclicker.jar "$pkgdir/usr/share/java/$_pkgname/Useful-Autoclicker.jar"
  install -Dm755 packaging/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 packaging/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 src/resources/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
