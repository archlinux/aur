# Maintainer: Thomas Hügel <thomas huegel -a-t- aquilenet fr>

pkgname=typedb-studio-bin
pkgver=3.0.5
pkgrel=1
pkgdesc="TypeDB Studio - Graphical IDE for TypeDB"
arch=('x86_64')
url="https://typedb.com/"
license=('MPL-2.0')
depends=('java-runtime>=17' 'gtk3' 'libxtst')
_pkgname=typedb-studio-linux-x86_64
source=("https://repo.typedb.com/public/public-release/raw/names/$_pkgname/versions/$pkgver/$_pkgname-$pkgver.tar.gz"
        "typedb-studio.desktop")
sha256sums=('6644f9027f3d3a943c9261719cf7a550a8e8181ee14825d29b6376b397906582'
            'b23f94f31ae5ca7f8a72039630cd72f20e82e02b6f330988b34b4bc6f727de12')

_pkgdir=typedb-studio-linux

prepare() {
  cd "$srcdir/$_pkgdir"
  chmod -x LICENSE
  chmod +x typedb-studio
}

package() {
  # Main directory
  install -d -m755 "$pkgdir/opt/typedb-studio"
  cp -a "$srcdir/$_pkgdir"/* "$pkgdir/opt/typedb-studio"

  # Symbolic link to the executable
  install -d -m755 "$pkgdir/usr/bin"
  ln -s /opt/typedb-studio/typedb-studio "$pkgdir/usr/bin/typedb-studio"

  # Launcher
  install -Dm644 "$srcdir/typedb-studio.desktop" \
                 "$pkgdir/usr/share/applications/typedb-studio.desktop"

  # # Icons
  # for size in 32 64 128 256 512; do
  #   install -Dm644 "$pkgdir/opt/typedb-studio/lib/icon-${size}.png" \
  #                 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/typedb-studio.png"
  # done

  # # System configuration
  # install -d -m755 "$pkgdir/etc/typedb-studio"
  # ln -s /etc/typedb-studio/config.yml "$pkgdir/opt/typedb-studio/config.yml"
}