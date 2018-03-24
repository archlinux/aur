# Maintainer: Tomoaki Hashizaki <thashisaki@yahoo.com>

pkgname=cafeobj-sbcl
pkgver=1.5.7
pkgrel=1
pkgdesc="New generation algebraic specification and programming language (built by SBCL)"
arch=("i686" "x86_64")
url="https://cafeobj.org/"
license=('BSD')
depends=('bash')
source_i686=("https://cafeobj.org/files/1.5.7/cafeobj-1.5.7-sbcl-x32Linux.tar.gz"
'cafeobj-sbcl.desktop')
source_x86_64=("https://cafeobj.org/files/1.5.7/cafeobj-1.5.7-sbcl-x64Linux.tar.gz"
'cafeobj-sbcl.desktop')
sha256sums_i686=('ce10276e0f0bb3ba79c87e47554af0752cc53921f45d6273a8123c1a41d49377'
'995d18d3e4bd96cd0eab29205c5c561e653fca8124e976c0433afe8cb11cbc32')
sha256sums_x86_64=('7a81b2c37d64bc19b5102695798803bfb8ed48e50a1e86901e75645219b0d8b3'
'995d18d3e4bd96cd0eab29205c5c561e653fca8124e976c0433afe8cb11cbc32')
options=(!strip)

package() {
  cd "${srcdir}/"

  #bin
  install -Dm755 {${srcdir},${pkgdir}/usr}/bin/cafeobj

  #lib
  install -Dm755 {${srcdir},${pkgdir}/usr}/lib/cafeobj-1.5/sbcl/cafeobj.sbcl

  #share cafeobj-1.5
  install -d ${pkgdir}/usr/share/cafeobj-1.5/lib
  install -d ${pkgdir}/usr/share/cafeobj-1.5/prelude
  cp -r ${srcdir}/share/cafeobj-1.5/ ${pkgdir}/usr/share/

  #share doc
  install -d ${pkgdir}/usr/share/doc/cafeobj/examples
  cp -r ${srcdir}/share/doc/ ${pkgdir}/usr/share/

  #share man
  install -d "$pkgdir/usr/share/man/man1"
  gzip -c "$srcdir/share/man/man1"/cafeobj.1 > "$pkgdir/usr/share/man/man1"/cafeobj.1.gz

  #share emacs
  install -Dm755 {${srcdir},${pkgdir}/usr}/share/emacs/site-lisp/cafeobj-mode.el

  #creating custom license directory (CafeOBJ does not provide license file so far.) 
  #install -d ${pkgdir}/usr/share/licenses/cafeobj-sbcl

  # Install desktop file
    install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
