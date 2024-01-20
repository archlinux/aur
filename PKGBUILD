# Maintainer: Kisaragi Hiu <mail at kisaragi-hiu.com>
# Based on the PKGBUILD of funemustation-git

pkgname=hypertimer-git
pkgver=0.2.3.r6.gdabb7db
pkgrel=1
pkgdesc="A productivity tool to defeat time blindness"
url="https://codeberg.org/unfa/HyperTimer"
depends=('godot' 'bash')
makedepends=('git')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://codeberg.org/unfa/HyperTimer.git")
sha256sums=('SKIP')
provides=('hypertimer')

pkgver() {
  cd "$srcdir/HyperTimer"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/HyperTimer"

  mkdir -p "bin"
  echo "#!/bin/sh
godot --main-pack \"/usr/share/hypertimer/HyperTimer.zip\"" >"bin/hypertimer"

  # do this to not need to grab the export templates
  godot --headless --path "." --export-pack "Linux/X11" "bin/HyperTimer.zip"
}

package() {
  cd ${srcdir}/HyperTimer

  install -Dm644 "bin/HyperTimer.zip" "$pkgdir/usr/share/hypertimer/HyperTimer.zip"
  install -Dm755 "bin/hypertimer" "$pkgdir/usr/bin/hypertimer"
}
