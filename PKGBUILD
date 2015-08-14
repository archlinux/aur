# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=narcissu2-en
pkgver=1.1
pkgrel=8
pkgdesc='A free japanese visual novel game, translated into English. This package includes both Narcissu and Narcissu: Side 2nd.'
arch=('any')
url='http://www.neechin.net/narcissu/'
license=('custom:freeware')
depends=('ponscripter' 'sh')
install=${pkgname}.install

source=('[Denpa]_Narcissu_2_Eng_[unix].tar.bz2::http://www.neechin.net/file_download/22/'
	'Narcissu_2_Eng_v1.1_script_[All_platforms].zip::http://www.neechin.net/file_download/27/Narcissu_2_Eng_v1.1_script_%5BAll_platforms%5D.zip'
	"${pkgname}.sh"
	"${pkgname}.6.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")

md5sums=('e785f7bb8735867b130c78dd17da3a5f'
         'cbbdf90489e0b937454e4ed94d63824a'
         'ba48169116ead98b2a2b121adeb239e5'
         '791f635920d6f3a08f955e96becc4065'
         'ab0d31fd74a0dd4fec3141ffc41bc7bd'
         'caeca7f043c9384c89d95c0e8455d41c')

package() {

  # copy main files
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/narcissu2-installer/data"
  install -m644 arc1.nsa arc.nsa cursor0.bmp nar01.mpg "${pkgdir}/usr/share/${pkgname}"
  install -m644 "${srcdir}/0.utf" "${pkgdir}/usr/share/${pkgname}"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/${pkgname}/icon.png"

  # copy bash script
  install -D -m755 "${srcdir}/narcissu2-en.sh" "${pkgdir}/usr/bin/${pkgname}"

  # copy man
  install -D -m644 "${srcdir}/narcissu2-en.6.gz" "${pkgdir}/usr/share/man/man6/narcissu2-en.6.gz"

  # copy documentation
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${srcdir}/narcissu2-installer/"
  install -m644 INSTALL README "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README_v1.1"

  # install desktop entry file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
