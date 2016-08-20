# Maintainer: Your Name <youremail@domain.com>
pkgname=gstreamer-screenrecording-git
pkgver=r45.a9972fb
pkgrel=1
pkgdesc="Record screen or window  with VAAPI(intel I420 or NV12), OMX(radeon NV12), software (x264enc I420 or NV12) to mkv file, with or without sound."
arch=('any')
url="https://github.com/pontostroy/gstreamer-screenrecording"
license=('GPL')
depends=("kdebase-kdialog") # remove what you don't need?
optdepends=("gst-omx: For radeon VCE" "libomxil-bellagio: For radeon VCE" "gstreamer-vaapi: For Intel Quick Sync" "x264: For software encoding")
makedepends=('git')
provides=("gstreamer-screenrecording")
conflicts=("gstreamer-screenrecording")
source=("git+https://github.com/pontostroy/gstreamer-screenrecording.git")
md5sums=("SKIP") #generate with 'makepkg -g'

#build() {
#  cd gstreamer-screenrecording
#  ./autogen.sh
#  ./configure --prefix=/usr
#  make
#}

package() {
  cd "gstreamer-screenrecording"
  #make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/bin"
  install -m755 rec.sh "$pkgdir/usr/bin/gstreamer-screenrecording"
  install -m755 gsttwich.sh "$pkgdir/usr/bin/gstreamer-screenrecording-twitch"
}

pkgver() {
  cd "gstreamer-screenrecording"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# vim:set ts=2 sw=2 et:
