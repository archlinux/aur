# Maintainer: kj_sh604 <406hs_jk@proton.me> 

pkgname=seamonkey-bin
pkgver=2.53.21
pkgrel=1
pkgdesc="SeaMonkey internet suite (binary version)"
arch=('x86_64')
url="http://www.seamonkey-project.org/"
license=(MPL-2.0)
depends=(
  at-spi2-core
  bash
  cairo
  dbus
  dbus-glib
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hunspell
  libevent
  libffi
  libpulse
  libvpx
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrender
  libxt
  mime-types
  nspr
  nss
  pango
  pixman
  sqlite
  startup-notification
  zlib
)
optdepends=(
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'ffmpeg: H.264 video support'
)
source=("https://archive.seamonkey-project.org/releases/$pkgver/linux-x86_64/en-US/seamonkey-$pkgver.en-US.linux-x86_64.tar.bz2")
conflicts=('seamonkey')
provides=('seamonkey')
sha256sums=('19e819428dbec28e63ca197444d80e8456f106a462254521009f7ae85dae5c16')

package() {
    cd "$srcdir/seamonkey"
    install -d "$pkgdir/opt/seamonkey"
    cp -r * "$pkgdir/opt/seamonkey/"
    install -d "$pkgdir/usr/bin"
    ln -s /opt/seamonkey/seamonkey "$pkgdir/usr/bin/seamonkey"
    install -d "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/seamonkey.desktop"
[Desktop Entry]
Name=SeaMonkey
GenericName=Internet Suite
Comment=Web browser, advanced email, newsgroup and feed client, IRC chat, and web development tools
Exec=/opt/seamonkey/seamonkey %u
Icon=seamonkey
Terminal=false
Type=Application
Categories=Network;WebBrowser;Email;News;Chat;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;
EOF

    for size in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        install -m644 "chrome/icons/default/default${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/seamonkey.png"
    done
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
