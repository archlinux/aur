# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=skykeep-bin
pkgver=0.1.43
pkgrel=1
pkgdesc="Native iCloud apps: Notes, Reminders, Calendar, Contacts, Drive and Photos, offline and in sync (upstream binary)"
arch=('x86_64')
url="https://github.com/YashwanthKamireddi/Skykeep"
license=('GPL-3.0-only')
# What the binary links (readelf -d), plus the GStreamer plugins it loads for
# videos: base and good for the elements, libav for H.264 and HEVC.
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gst-libav'
         'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer'
         'gtk3' 'hicolor-icon-theme' 'libgcc' 'libheif' 'libpipewire' 'libsoup3'
         'webkit2gtk-4.1')
# The keyring is spoken to over D-Bus, so it needs a Secret Service, not libsecret.
optdepends=('org.freedesktop.secrets: stay signed in'
            'fuse3: iCloud Drive and Photos as folders in the file manager'
            'usbmuxd: the iPhone as camera and microphone over the cable'
            'gst-plugin-va: the iPhone camera decoded on the graphics chip'
            'gst-plugins-bad: the iPhone camera decoded on the graphics chip')
provides=('skykeep')
conflicts=('skykeep')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Skykeep_${pkgver}_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('c39c7a50f9316f9f44613a188eb2b88f552f58c6b084cee074f71374211b0a23')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" ./usr

  # no icon theme reads this folder, the 512px icon covers it
  rm -r "$pkgdir/usr/share/icons/hicolor/256x256@2"
}
