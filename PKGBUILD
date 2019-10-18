# Maintainer: Tinu Weber <http://ayekat.ch>

pkgname=makemetapkg
pkgver=0.9.6
pkgrel=1
arch=(any)

pkgdesc='Create meta-packages for pacman'
url='https://gitlab.com/ayekat/pacman-hacks'
license=(GPL3)

# Both are part of pacman-hacks. If you want both makemetapkg and remakepkg,
# just install pacman-hacks:
# https://gitlab.com/ayekat/PKGBUILDs/tree/pacman-hacks
conflicts=(remakepkg)

depends=(coreutils)
makedepends=(asciidoc git)

changelog='CHANGELOG'

source=("git+https://gitlab.com/ayekat/pacman-hacks.git#tag=v$pkgver")
sha256sums=(SKIP)

_tools='makemetapkg metapkg'

build() {
  cd pacman-hacks
  make \
    PREFIX=/usr \
    SCRIPTS="$_tools" \
    MANPAGES="$_tools"
}

package() {
  depends+=(bash fakeroot pacman sed sh)

  cd pacman-hacks
  make \
    PREFIX=/usr \
    DESTDIR="$pkgdir" \
    SCRIPTS="$_tools" \
    MANPAGES="$_tools" \
    install
  install -Dm 0644 README "$pkgdir"/usr/share/doc/remakepkg/README
  install -Dm 0644 CHANGELOG "$pkgdir"/usr/share/doc/remakepkg/CHANGELOG
}
