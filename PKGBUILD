# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=picard-plugins-v2-git
pkgver=1.4.1.r238.0fd80b8
_pkgver=1.4.1
pkgrel=1
pkgdesc="plugins from picard-plugins repository (for picard-git/Picard 2.0, currently in development)"
arch=('any')
url="https://picard.musicbrainz.org/plugins/"
license=('GPL')
depends=('picard>=1.4.1.r111.g4f759c7d-1')
conflicts=("picard<=${_pkgver}")
source=(git+https://github.com/metabrainz/picard-plugins.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/picard-plugins"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/picard-plugins"
  python generate.py
}

package() {
  pythonver=$(python --version | sed -E 's/Python (3\.[0-9]+)\.*/\1/')
  plugindir="${pkgdir}/usr/lib/python${pythonver}/site-packages/picard/plugins"
  install -d "$plugindir"
  # copy all plugins
  cp "$srcdir/picard-plugins/plugins/"*.zip "$plugindir"
}

# vim:set ts=2 sw=2 et:
