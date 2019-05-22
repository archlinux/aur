# Maintainer: X3n0m0rph59 <x3n0m0rph59@gmail.com>

pkgname='eruption-roccat-vulcan-git'
_pkgname='eruption-roccat-vulcan'
pkgdesc='Linux user-mode driver for the ROCCAT Vulcan 100/12x series keyboards'
pkgver='0.0.3'
pkgrel='2'
epoch=
arch=('i686' 'x86_64')
url='https://x3n0m0rph59.gitlab.io/eruption-roccat-vulcan/'
license=('GPL3+')
groups=()
depends=()
makedepends=('git' 'rust' 'libevdev' 'hidapi' 'systemd-libs')
checkdepends=()
optdepends=()
provides=()
conflicts=('eruption-roccat-vulcan')
replaces=()
backup=()
options=()
#install="$pkgname.install"
changelog=
source=('git+https://gitlab.com/X3n0m0rph59/eruption-roccat-vulcan.git')
noextract=()
sha512sums=('SKIP')
PKGEXT='.pkg.tar.gz'

build() {
    cd "$_pkgname"

    CARGO_INCREMENTAL=0 cargo build --all --release
}

package() {
  cd "$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/eruption"
  mkdir -p "$pkgdir/usr/lib/eruption"  
  mkdir -p "$pkgdir/usr/share/doc/eruption"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  mkdir -p "$pkgdir/usr/lib/systemd/system-preset"
  mkdir -p "$pkgdir/usr/lib/systemd/user-preset"

  mkdir -p "$pkgdir/etc/dbus-1/system.d"
  mkdir -p "$pkgdir/usr/share/man/man8"
  mkdir -p "$pkgdir/usr/share/man/man5"
  mkdir -p "$pkgdir/usr/share/man/man1"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/eruption/i18n"
  
  install -m 755 "target/release/eruption" "$pkgdir/usr/bin/"
  install -m 644 "support/config/eruption.conf" "$pkgdir/etc/eruption/"

  install -m 644 "src/scripts/afterglow.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/breathe.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/gaming.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/gradient.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/impact.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/rainbow.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/raindrops.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/shockwave.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/sysmon.lua" "$pkgdir/usr/lib/eruption/"
  install -m 644 "src/scripts/temperature.lua" "$pkgdir/usr/lib/eruption/"
}
