# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-gtk
_pkgname=milena_gtk
pkgver=0.2
pkgrel=2
pkgdesc="Gtk2 gui Milena speech synthesizer (screen reader, etc)"
arch=(any)
url="http://milena.polip.com/"
license=('GPL')
depends=('milena' 'python2-xlib')
source=("http://tts.polip.com/files/${_pkgname}-${pkgver}.tar.gz"
        "milena-gtk.desktop"
        "01-python2+iconpath.patch")
sha256sums=('31732eaaa5ea3b3f4a0012098092928f261a90745c4e7f4e8c3808f318339c15'
            '7e606231725d305e8fd5f49ed489df28fc2293d4d509cdb91f8a7b93a8c33513'
            'e3aac040cd31af92e5135be1bf451a68fab7c71ec871b4a75a70133a0ec0ed1b')

prepare() {
  cd ${_pkgname}
  patch -Np0 -i "$srcdir"/01-python2+iconpath.patch
}

package() {
  install -dm755 "$pkgdir"/usr/{bin,share/{pixmaps,applications,doc/$pkgname}}

  install -m644 milena-gtk.desktop "$pkgdir"/usr/share/applications/

  cd ${_pkgname}

  install -m755 milena_gtk.py "$pkgdir"/usr/bin/$pkgname
  install -m644 milena_tray1.png "$pkgdir"/usr/share/pixmaps/milena-gtk.png
  install -m644 README "$pkgdir"/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
