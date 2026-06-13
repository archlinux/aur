# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=simplesinewavegenerator-git
pkgver=e595d4e
pkgrel=1
pkgdesc="Simple sine wave generator with GTK3 GUI and logarithmic frequency sweep"
arch=('x86_64')
url="https://github.com/ixnewton/simpleSineWaveGenerator"
license=('MIT')
depends=('gtk3')
makedepends=('gcc' 'pkg-config' 'git' 'libpulse')
optdepends=('pulseaudio: PulseAudio backend (or pipewire-pulse)')
source=("git+https://github.com/ixnewton/simpleSineWaveGenerator.git#branch=Sweep-Generator-aur")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/simpleSineWaveGenerator"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/simpleSineWaveGenerator"
  make -f Makefile.gtk
}

package() {
  cd "$srcdir/simpleSineWaveGenerator"
  
  # Install binary
  install -Dm755 simpleSineWaveGenerator "$pkgdir/usr/bin/simpleSineWaveGenerator"
  
  # Install desktop file
  install -Dm644 simplesinewavegenerator.desktop "$pkgdir/usr/share/applications/simplesinewavegenerator.desktop"
  
  # Install icon
  install -Dm644 simplesinewavegenerator.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/simplesinewavegenerator.svg"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
