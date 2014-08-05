# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perlpanel-git
pkgver=0.9.1.34
pkgrel=3
pkgdesc="The ideal accompaniment to a light-weight Window Manager such as OpenBox, or a desktop-drawing program like iDesk."
arch=('any')
#url="http://savannah.nongnu.org/projects/perlpanel"
url="https://github.com/bbidulock/perlpanel"
license=('GPL')
provides=('perlpanel')
conflicts=('perlpanel' 'perlpanel-light')
options=('!emptydirs')
install=perlpanel.install
depends=('glade-perl' 'gnome-vfs-perl' 'perl-timedate' 'perl-gnome2-wnck'
	 'perl-locale-gettext' 'perl-xml-parser' 'perl-xml-simple')
optdepends=('perl-xmms: XMMS applet'
	    'xdg-traymenu: XDGMenu applet'
	    'perl-hardware-sensorparser: Sensors applet')
source=("$pkgname::git+https://github.com/bbidulock/perlpanel.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's,release-,,;s,-g.*$,,;s,[-_],.,g'
}

build() {
  cd $pkgname
  make PREFIX="/usr" VERSION="$pkgver"
}

package() {
  cd $pkgname
  make PREFIX="/usr" VERSION="$pkgver" DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -exec rm '{}' \;
  find $pkgdir -name 'perllocal.pod' -exec rm '{}' \;
}
