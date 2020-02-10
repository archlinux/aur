# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marco Pompili <aur (at) emarcs (dot) org>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Danny Coates <dannycoates@gmail.com>
# Contributor: Danny Coates <dannycoates@gmail.com>
# Contributor: 3y3 <3y3@bk.ru>
# Contributor: Adam Hořčica <horcicaa@gmail.com>
# Contributor: Akzhan Abdulin <akzhan.abdulin@gmail.com>
# Contributor: cattail <zhongchiyu@gmail.com>
# Contributor: Dave <badave@gmail.com>
# Contributor: Dick Hardt <dickhardt@gmail.com>
# Contributor: Gary Katsevman <git@gkatsev.com>
# Contributor: Glenn Block <glenn.block@gmail.com>
# Contributor: Ionuț G. Stan <ionut.g.stan@gmail.com>
# Contributor: Karan Batra-Daitch <karanganesha04@gmail.com>
# Contributor: Kasper Ligaard <kasperligaard@gmail.com>
# Contributor: Mark Constable <markc@renta.net>
# Contributor: Matthew O'Riordan <matthew.oriordan@gmail.com>
# Contributor: Michael Schoonmaker <michael@strongloop.com>
# Contributor: Miroslav Bajtos <miroslav@strongloop.com>
# Contributor: Panagiotis Astithas <pastith@gmail.com>
# Contributor: Peter Flannery <flannery.peter@ntlworld.com>
# Contributor: Philip Tellis <philip.tellis@gmail.com>
# Contributor: Sam Roberts <sam@strongloop.com>
# Contributor: Sergey Krilov <serg.kr@gmail.com>
# Contributor: ssafejava <s@safejava.com>
# Contributor: dannycoates <dannycoates@gmail.com>
# Contributor: piscisaureus <bertbelder@gmail.com>
# Contributor: bajtos <miroslav@strongloop.com>
# Contributor: strongloop <callback@strongloop.com>

_npmname=node-inspector
pkgname=nodejs-$_npmname
pkgver=1.1.2
pkgrel=2
pkgdesc="Web Inspector based nodeJS debugger"
arch=('any')
url="https://github.com/$_npmname/$_npmname/"
license=('BSD')
depends=('nodejs-lts-dubnium')
makedepends=('npm' 'node-gyp')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver".tgz)
sha256sums=('969f309a0148bb9546999e7b45d474a4e5fd3715967a982e7e776022aca3577f')
noextract=("${source[@]##*/}")

package() {
  npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -name package.json -exec sed -i -e "/${pkgdir//\//\\/}/d" -e "/${srcdir//\//\\/}/d" {} \;
  chown -R root:root $pkgdir
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
