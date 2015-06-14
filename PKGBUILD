# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gimp-plugin-akkana-git
provides=(gimp-plugin-akkana)
conflicts=(gimp-plugin-akkana)
pkgver=1
pkgrel=1
pkgdesc='A collection of GIMP scripts and plug-ins by Akkana Peck.'
arch=('any')
url='https://github.com/akkana/gimp-plugins'
license=('GPL2')
depends=(gimp)
optdepends=('glabels: crating labels and business cards')
source=('git://github.com/akkana/gimp-plugins.git')
md5sums=('SKIP')
_gitname='gimp-plugins'

package(){
  cd "$srcdir"/$_gitname
  _scripts='/usr/share/gimp/2.0/scripts/'
  _plugins='/usr/lib/gimp/2.0/plug-ins/'
  install -dm755 "$pkgdir"/{$_scripts,$_plugins}
  for i in *.py; do
    install -Dm755 $i "$pkgdir"/$_scripts
  done
  for i in *.scm; do
    install -Dm644 $i "$pkgdir"/$_plugins
  done
  install -Dm644 gimplabels/labels.scm "$pkgdir"/$_scripts/labels.scm
  sed -e 's#/glabels/#/libglabels-3.0/#g' -i "$pkgdir"/$_scripts/labels.scm

  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
