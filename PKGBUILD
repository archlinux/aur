# Maintainer: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao-git
_pkgname=ao
pkgver=v5.2.0.r2.g94eac0c
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft Todo"
arch=('x86_64')
url="https://klauscfhq.github.io/ao/"
license=('MIT')
groups=()
depends=('nodejs')
makedepends=('nodejs' 'electron' 'git')
install=
changelog=
source=(
  git+https://github.com/klauscfhq/$_pkgname.git
  $_pkgname.desktop
  $_pkgname.sh
) 
sha256sums=('SKIP'
            'f0704b8b0a39cabacdc8a9294855f41923f9cd29d5607ceafb189dd7f6522c4b'
            'e36cb7ed66e0c1f4f45be133d5b63ddad37687a8f5ae25889b88dc69ad4183be')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd ao
  npm install
  npm run pack
}
package() {
  install -D "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D "${srcdir}/ao/static/Icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r --preserve=mode $srcdir/ao/dist/linux-unpacked/* "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm=0755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
