# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=2.2.3
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake' 'wayland-protocols')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz")
sha256sums=('0727d8652e6debea52a9d975bd656cb573556e0e14184b069925c40f2f1b02b4')

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX=/usr ETC_PREFIX=/ WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES WITH_LAYERSHELL=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake DESTDIR="${pkgdir}" PREFIX=/usr ETC_PREFIX=/ WITHOUT_SUID=YES install
}

