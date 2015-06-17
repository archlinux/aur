# Maintainer Phillip Wood <phillip.wood@dunelm.org.uk>
# Based on the sound-juicer PKGBUILD
#   - Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
#   - Contributor: Jan de Groot <jgc@archlinux.org>
#   - Contributor: Ben <contrasutra@myrealbox.com>

pkgname=sound-juicer-git
_pkgname=${pkgname%-git}
pkgver=1
pkgrel=2
pkgdesc="A cd ripper application"
arch=(i686 x86_64)
license=(GPL)
conflicts=(sound-juicer)
replaces=(sound-juicer)
depends=(libmusicbrainz5 libdiscid gtk3 gst-plugins-base gst-plugins-good brasero hicolor-icon-theme iso-codes)
optdepends=('gst-plugins-ugly: for MP3 encoding'
            'gst-plugins-bad: for Opus encoding')
makedepends=(intltool yelp-tools gnome-common appstream-glib)
options=(!emptydirs)
url="http://www.gnome.org"
install="$pkgname.install"
source=("git://git.gnome.org/sound-juicer.git"
        "$pkgname.install")
sha256sums=('SKIP'
            'b9e4f14cd493e0b9066a4a22e8a477bbfda18999f994524454b42249646461ee')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git describe | sed 's#-#_#g;s#v##')
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --libexecdir=/usr/lib/${_pkgname}
}

package() {
  cd "${srcdir}/${_pkgname}"
  make GSETTINGS_DISABLE_SCHEMAS_COMPILE=1 DESTDIR="${pkgdir}" install
}
