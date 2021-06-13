# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Phillip Smith <pkgbuild@phs.id.au>

pkgname=tile-world
pkgver=1.3.2
pkgrel=3
pkgdesc="Emulation of the game Chip's Challenge"
arch=('any')
url="http://www.muppetlabs.com/~breadbox/software/tworld/"
license=('GPL')
depends=('sdl')
source=(
  "http://www.muppetlabs.com/~breadbox/pub/software/tworld/tworld-${pkgver}-CCLPs.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
md5sums=(
  'e3da2220f4ea090111e0300ad901b94e'
  'f65ba125d56f7febd11c07d52a0854ad'
  '0406fbaf20ba6bba4cf2d55c2d1c2b3f'
)

build() {
  cd "${srcdir}/tworld-${pkgver}"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
  
  make
}
  
package() {
  cd "${srcdir}/tworld-${pkgver}"
  install -dm755 "${pkgdir}"/usr/{bin,share/{tworld,man/man6}}
  install -dm755 "${pkgdir}/usr/share/tworld/"{sets,data,res}
  install -m755 tworld "${pkgdir}/usr/bin"
  ln -s "/usr/bin/tworld" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 sets/*.dac "${pkgdir}/usr/share/tworld/sets"
  install -m644 data/*.dat "${pkgdir}/usr/share/tworld/data"
  install -m644 res/{rc,*.bmp,*.txt,*.wav} "${pkgdir}/usr/share/tworld/res"
  install -m644 docs/tworld.6 "${pkgdir}/usr/share/man/man6"
	install -DTm644 ${startdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -DTm644 ${startdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
