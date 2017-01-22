# $Id: PKGBUILD 174186 2016-05-07 16:10:24Z muflone $
# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: SergHeart

pkgname=arista
pkgver=0.9.7
pkgrel=12
pkgdesc="Easy to use multimedia transcoder for the GNOME Desktop"
arch=('any')
url="http://transcoder.org/"
license=('LGPL2.1')
depends=('pygtk' 'python2-gconf' 'python2-dbus' 'librsvg' 'python2-gudev' 'gstreamer0.10-python' 'desktop-file-utils')
optdepends=('pywebkitgtk: show in-app codecs help'
            'python2-notify: show notifications in your desktop environment'
            'gstreamer0.10-ffmpeg: enable FFMpeg based audio/video plugins'
            'gstreamer0.10-base-plugins: enable basic set of well-supported audio/video plugins'
            'gstreamer0.10-good-plugins: enable a set of well-supported free audio/video plugins'
            'gstreamer0.10-bad-plugins: enable a set of less supported audio/video plugins'
            'gstreamer0.10-ugly-plugins: enable a set of well-supported non-free audio/video plugins')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/danielgtaylor/${pkgname}/archive/${pkgver}.tar.gz"
        "fix-for-python2.patch"
        "gst-webkit-imports.patch"
        "remove-arista-nautilus_py.patch")
sha256sums=('87d5530d9c7bf2b8ca60f0d356b1a7e431e1798f72db8c5f14f1eba6cecd1cca'
            '7f783c54122eb4b47b121a3a47ee69d552cb6f1b5a78ed6836b48f12d2b1883d'
            '625c2767a36e591b38ef31e28dddb8e45218b632ce2a150f12ed2eed34746406'
            '704fd490fb48e334abc84274e6e9012bd514afd4cf33313dd34fc96eacf83c7b')
conflicts=('arista-transcoder')
replaces=('arista-transcoder')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "../fix-for-python2.patch"
  patch -p1 -i "../gst-webkit-imports.patch"
  # The script arista-nautilus.py doesn't work with Nautilus 3.x
  patch -p1 -i "../remove-arista-nautilus_py.patch"
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
