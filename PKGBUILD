# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins-git
pkgver=1.3.r11.5e6d796
_pkgver=1.3
pkgrel=1
pkgdesc="plugins from picard-plugins repository (except contrib)"
arch=('any')
url="http://picard.musicbrainz.org/plugins/"
license=('GPL')
depends=('picard')
conflicts=('picard-git<=1.3')
source=(git+https://github.com/musicbrainz/picard-plugins.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/picard-plugins"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  cd "$srcdir/picard-plugins/plugins"
  install -d "$plugindir"
  # copy all plugins
  cp -r * "$plugindir"

  # remove plugins already in Picard package (contrib)
  cd "$plugindir"
  rm -r addrelease albumartist_website classicdiscnumber \
    cuesheet discnumber featartist featartistsintitles \
    lastfm lastfmplus no_release release_type replaygain \
    sort_multivalue_tags standardise_performers titlecase \
    tracks2clipboard viewvariables
}

# vim:set ts=2 sw=2 et:
