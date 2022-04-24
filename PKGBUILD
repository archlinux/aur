# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Sebastien Piccand <sebcactus gmail com>

_pkgbase=gaupol
pkgbase=${_pkgbase}-git
pkgname=('gaupol-git' 'aeidon-git')
pkgver=1.11.1.g8eae3998
pkgrel=2
arch=('any')
url="https://otsaloma.io/gaupol"
license=('GPL')
makedepends=('intltool' 'git'
             'python-gobject' 'gtk3' 'gst-plugins-'{base,good,bad,ugly}
             'gst-libav' 'gst-plugin-gtk' 'gspell' 'iso-codes' 'python-chardet' 'python-cairo' 'desktop-file-utils' 'hicolor-icon-theme')
source=("git+https://github.com/otsaloma/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgbase}
  git describe --always | sed 's|-|.|g'
}

package_aeidon-git() {
  pkgdesc='Python package that provides classes and functions for dealing with text-based subtitle files of many different formats'
  depends=('iso-codes' 'python-chardet')
  provides=('aeidon')
  conflicts=('aeidon')
  cd ${_pkgbase}
  python setup.py --without-gaupol --without-iso-codes install --root="$pkgdir" -O1
}

package_gaupol-git() {
  pkgdesc="Editor for text-based subtitle files. GUI."
  depends=('aeidon-git'
           'python-gobject' 'gtk3' 'gst-plugins-'{base,good,bad,ugly}
           'gst-libav' 'gst-plugin-gtk' 'gspell' 'python-cairo' 'desktop-file-utils' 'hicolor-icon-theme')
  optdepends=('python-pyenchant: spell-checking'
    'gtkspell3: inline spell-checking'
    'mplayer: subtitle preview'
    'vlc: subtitle preview'
    'gst-plugins-bad: extra media codecs'
    'gst-plugins-ugly: extra media codecs'
    'gst-libav: extra media codecs')
  provides=("${_pkgbase}")
  conflicts=("${_pkgbase}")
  install=gaupol.install
  cd ${_pkgbase}
  python setup.py --without-aeidon install --root="$pkgdir" -O1
}
