# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=2.3.1
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots>=0.14' 'wlroots<0.15' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake' 'wayland-protocols')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz")
sha256sums=('345b2a732dcc7499d3b967811698009b2bc1ad36dab08e46084b3f6a8ec2aeb9')

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX=/usr ETC_PREFIX=/ WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES WITH_LAYERSHELL=YES WITH_VIRTUAL_INPUT=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake DESTDIR="${pkgdir}" PREFIX=/usr ETC_PREFIX=/ WITHOUT_SUID=YES install
}

