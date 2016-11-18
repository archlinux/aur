# Maintainer: James Bunton <jamesbunton@delx.net.au>

# The latest version can be found like this:
# $ curl -s https://bluejeans.com/downloads | grep 'desktop/linux'

pkgname=bluejeans
pkgver=1.20.25
pkgrel=1
pkgdesc="BlueJeans app"
arch=('x86_64')
url="https://www.bluejeans.com"
license=('Proprietary')
groups=()
depends=('alsa-lib'
         'atk'
         'bzip2'
         'cairo'
         'dbus'
         'dbus-glib'
         'expat'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'gconf'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'graphite'
         'gtk2'
         'harfbuzz'
         'libcap'
         'libdatrie'
         'libdrm'
         'libffi'
         'libgcrypt'
         'libgpg-error'
         'libnotify'
         'libpng'
         'libsystemd'
         'libthai'
         'libutil-linux'
         'libx11'
         'libxau'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxdmcp'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxrandr'
         'libxrender'
         'libxshmfence'
         'libxtst'
         'libxxf86vm'
         'lz4'
         'mesa'
         'mesa-libgl'
         'nspr'
         'nss'
         'pango'
         'pcre'
         'pixman'
         'wayland'
         'xz'
         'zlib')
makedepends=('rpmextract')
install=bluejeans.install
source=(https://swdl.bluejeans.com/desktop/linux/${pkgver%.*}/${pkgver}/bluejeans-${pkgver}.x86_64.rpm)
sha256sums=('6507fee589042c88ab7818c26b01752866caed114b8592efbc6c58a7f74aebfc')

package() {
  # extract rpm
  rpmextract.sh "bluejeans-${pkgver}.x86_64.rpm"

  # add bluejeans wrapper to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x "opt/bluejeans/bluejeans"
  ln -nsf "/opt/bluejeans/bluejeans" "${pkgdir}/usr/bin/bluejeans"

  # install desktop file and icons
  mkdir -p "${pkgdir}/usr/share/applications/"
  mv "opt/bluejeans/bluejeans.desktop" "${pkgdir}/usr/share/applications/"
  mv "opt/bluejeans/icons" "${pkgdir}/usr/share/"

  # hack for libudev.so.0
  ln -nsf "/usr/lib/libudev.so.1" "opt/bluejeans/libudev.so.0"

  # put the rest in /opt
  mv "opt" "${pkgdir}"
}
