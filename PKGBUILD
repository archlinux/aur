# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gedit-trailsave-git
pkgver=3.3.0.r6.g0975355
pkgrel=1
pkgdesc="A plugin for gedit 3 to strip trailing whitespace on save"
arch=('any')
url="https://github.com/jonleighton/gedit-trailsave"
license=('GPL')
depends=('gedit')
source=(git://github.com/jonleighton/gedit-trailsave)
sha256sums=('SKIP')
provides=('gedit-trailsave')
conflicts=('gedit-trailsave')

function pkgver() {
  cd gedit-trailsave

  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd gedit-trailsave

  install -Dm644 -t "$pkgdir/usr/lib/gedit/plugins" \
    trailsave.{plugin,py}

  # Compile Python scripts
  python -m compileall "$pkgdir"
  python -O -m compileall "$pkgdir"
}

# vim:set ts=2 sw=2 et:
