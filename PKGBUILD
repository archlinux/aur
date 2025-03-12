# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

_pkgname="srb2-legacy"
pkgname="${_pkgname}-git"
pkgver=2.1.27.r369.g869647d
_dataver=2.1.25
pkgrel=1
pkgdesc='Updated fork of Sonic Robo Blast 2 2.1.25'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url='https://github.com/P-AS/srb2-legacy'
depends=('sdl2' 'sdl2_mixer' 'curl' 'libpng' 'libgme' 'libopenmpt' "srb2-legacy-data>=$_dataver")
makedepends=('git' 'mesa')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/P-AS/srb2-legacy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^SRB2_release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/srb2-legacy/src

  [ "$CARCH" == "i686" ] && IS64BIT="" || IS64BIT="64"
  # (optional: be verbose)
  make LINUX$IS64BIT=1 #ECHO=1
}

package() {
  install -Dm755 "$_pkgname"/bin/lsdl2srb2legacy \
    "$pkgdir"/usr/bin/srb2legacy

  # icon + .desktop
  install -Dm644 "$_pkgname"/srb2.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/srb2legacy.png
  install -Dm644 "$_pkgname"/srb2legacy.desktop "$pkgdir"/usr/share/applications/srb2legacy.desktop
}
