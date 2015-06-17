# Maintainer: M0Rf30

pkgname=alsa-hda-tools-git
pkgver=1.41f2cb1
pkgrel=1
pkgdesc="Tools for the Linux High Definition Audio (HDA) ALSA driver"
arch=('i686' 'x86_64')
url="http://git.alsa-project.org/?p=alsa-hda-tools.git;a=summary"
license=('GPL')
depends=('pygtk' 'python2')
makedepends=('git')
conflicts=('hda-verb' 'hda-verb-git')
source=(patch
	"alsa-hda-tools::git://git.alsa-project.org/alsa-hda-tools.git")

package() {
  cd alsa-hda-tools
  cd hda-verb
  make && install -D -m755 hda-verb  $pkgdir/usr/bin/hda-verb
  cd ../hda-analyzer
  patch -Np0 -i ../../patch
  chmod +x * && install -m755 * $pkgdir/usr/bin/
  rm $pkgdir/usr/bin/run.py  
}

pkgver() {
  cd alsa-hda-tools
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('a0a0b3441be2ce61625cc13f7fda6258'
         'SKIP')
