# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=labnote2-git
_pkgname=labnote2
pkgver=r10.f5ce05b
pkgrel=1
pkgdesc='rst based desktop wiki'
arch=('any')
url='https://gitlab.gnome.org/phragment/labnote2'
license=('GPL3')
depends=('python' 'python-gobject' 'webkit2gtk' 'gtksourceview4' 'python-docutils' 'gspell')
optdepends=('python-pygments' 'ttf-droid')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.gnome.org/phragment/labnote2.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_pkgname"

	mkdir -p "$pkgdir/etc/labnote2/"
	mkdir -p "$pkgdir/opt/labnote2/"
  mkdir -p "$pkgdir/usr/share/applications/"
	cp -r src/* "$pkgdir/opt/labnote2/"
	cp -r config/* "$pkgdir/etc/labnote2/"
	cp config/config_desktop.ini "$pkgdir/etc/labnote2/default.ini"
	install -Dm755 labnote2.sh "$pkgdir/usr/bin/labnote2"
	cp labnote2.desktop "$pkgdir/usr/share/applications/labnote2.desktop"
}

# vim:set ts=2 sw=2 et:
