# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=springerdownload-git
pkgver=20150704.89.cac1c31
pkgrel=1
pkgdesc="Downloader for link.springer.com"
arch=('any')
url="http://tovotu.de/dev/518-Neuer-SpringerLink-Downloader/"
license=('GPL2')
depends=('python2' 'python2-pypdf' 'imagemagick' 'ghostscript' 'python2-beautifulsoup3')
makedepends=('git')
depends=('python2' 'python2-cssselect')
optdepends=('python2-gobject: for the GUI' 'gtk3: for the GUI')
conflicts=('springer_download')
replaces=('springer_download')

source=("$pkgname"::git://github.com/tuxor1337/springerdownload.git)
md5sums=('SKIP')

pkgver() {
	_date=`date +"%Y%m%d"`
	cd "${srcdir}/${pkgname}"
	echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's/env python/env python2/g' springer_download.py
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
