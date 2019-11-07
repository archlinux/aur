# based on https://github.com/rbn42/panon/blob/master/PKGBUILD
# Maintainer: Robin <rbn dot 86 et bigbrothergoogle>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Contributor: Philipp A. <flying-sheep@github.com>

_basename=panon
pkgname=plasma5-applets-${_basename}-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A Different Audio Spectrum Analyzer for KDE Plasma"
arch=('any')
url="http://github.com/rbn42/panon"
license=('GPL3')
depends=('plasma-workspace' 'python-docopt' 'python-numpy' 'python-pillow' 'python-pyaudio' 'python-websockets' 'qt5-websockets' 'qt5-3d') 
makedepends=('git')
provides=('plasma5-applets-panon-git')
conflicts=('plasma5-applets-panon-git' 'plasma5-applets-panon')
source=("git+https://github.com/rbn42/panon.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_basename}"
  rm ./kde/plasmoid/contents/shaders/example-*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"

  cd kde
  kpackagetool5 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid
  rm "$pkgdir/usr/share/plasma/plasmoids/kpluginindex.json"
}
