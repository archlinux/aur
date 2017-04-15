# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=picard-plugins-git
pkgver=1.4.r233.1f675ae
_pkgver=1.4
_gitbranch=1.0
pkgrel=1
pkgdesc="plugins from picard-plugins repository"
arch=('any')
url="https://picard.musicbrainz.org/plugins/"
license=('GPL')
depends=('picard')
conflicts=("picard<=${_pkgver}")
source=("git+https://github.com/metabrainz/picard-plugins.git#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/picard-plugins"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/picard-plugins"
  python2 generate.py
}

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  install -d "$plugindir"
  # copy all plugins
  cp "$srcdir/picard-plugins/plugins/"*.zip "$plugindir"
}

# vim:set ts=2 sw=2 et:
