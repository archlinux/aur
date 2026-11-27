# Maintainer: FTE3600 Linux contributors

pkgname=libfprint-fte3600-bin
pkgver=1.94.100.r99
pkgrel=1
pkgdesc='Prebuilt libfprint with FTE3600 SPI fingerprint support, DKMS glue, and toolkit'
arch=(x86_64)
url='https://github.com/wings1848/libfprint-fte3600'
license=(LGPL-2.1-or-later GPL-2.0-only MIT)
groups=(fprint)
depends=(libgcc glib2 glibc libgudev libgusb openssl pixman dkms python python-gobject)
optdepends=(
  'fprintd: enrollment and authentication service'
  'linux-headers: build the module for the standard Arch kernel'
  'linux-lts-headers: build the module for the LTS kernel'
  'gtk4: desktop GUI (fte3600-toolkit-gui)'
  'libadwaita: desktop GUI (fte3600-toolkit-gui)'
  'libnotify: desktop notifications during enrollment/verification'
  'libpulse: audio cues via paplay'
)
provides=("libfprint=$pkgver" 'libfprint-2.so=2-64')
conflicts=(libfprint libfprint-fte3600-git libfprint-fte3600-personal-git)
install=fte3600.install
options=(!strip !debug)
source=(
  "libfprint-fte3600-v${pkgver}-x86_64.pkg.tar.zst::https://github.com/wings1848/libfprint-fte3600/releases/download/v${pkgver}/libfprint-fte3600-v${pkgver}-x86_64.pkg.tar.zst"
)
noextract=("libfprint-fte3600-v${pkgver}-x86_64.pkg.tar.zst")
sha256sums=('79165471debd3a81282beb2b2ddac46262a3ed950a11ecb0c428f44cc8b45436')

package() {
  bsdtar --no-same-owner -xpf "$srcdir/libfprint-fte3600-v${pkgver}-x86_64.pkg.tar.zst" \
    -C "$pkgdir" \
    --exclude='.BUILDINFO' \
    --exclude='.INSTALL' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO'

  if [[ -d "$pkgdir/usr/share/doc/libfprint-fte3600-git" ]]; then
    mv "$pkgdir/usr/share/doc/libfprint-fte3600-git" "$pkgdir/usr/share/doc/$pkgname"
  fi
}
