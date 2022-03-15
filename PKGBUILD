# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Sebastien Piccand <sebcactus gmail com>
_base=gaupol
pkgname=${_base}-git
pkgver=20220221.2510
pkgrel=1
pkgdesc="Editor for text-based subtitles (devel tree)"
arch=('any')
url="https://otsaloma.io/gaupol"
license=('GPL')
provides=('gaupol')
conflicts=('gaupol')
depends=('python-gobject' 'gtk3' 'gst-plugins-'{base,good,bad,ugly}
  'gst-libav' 'gst-plugin-gtk' 'gspell' 'iso-codes' 'python-chardet' 'python-cairo' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'git')
optdepends=('python-pyenchant: spell-checking'
  'gtkspell3: inline spell-checking'
  'python-chardet: character encoding auto-detection'
  'mplayer: subtitle preview'
  'vlc: subtitle preview'
  'gst-plugins-bad: extra media codecs'
  'gst-plugins-ugly: extra media codecs'
  'gst-libav: extra media codecs')
source=(git+https://github.com/otsaloma/$_base)
sha1sums=('SKIP')
install=gaupol.install

pkgver() {
  cd gaupol
  _d=$(git log -n 1 --pretty=%ad --date=short | sed 's/-//g')
  _c=$(git log --pretty=%h | wc -l)
  printf '%s.%s' $_d $_c
}

package() {
  cd gaupol
  python setup.py --without-iso-codes install --root="$pkgdir" -O1
}
