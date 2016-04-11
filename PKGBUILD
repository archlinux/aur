# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=veracrypt
_pkgname=VeraCrypt
pkgver=1.17
_pkgver=${pkgver//_/-}
pkgrel=3
pkgdesc="Disk encryption with strong security based on TrueCrypt"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://veracrypt.codeplex.com/"
license=('custom')
depends=('fuse' 'wxgtk>=3.0')
makedepends=('nasm')
install='veracrypt.install'

source=("${pkgname}_${pkgver}_Source.tar.bz2::https://sourceforge.net/projects/${pkgname}/files/${_pkgname} ${pkgver}/${pkgname}_${pkgver}_Source.tar.bz2/download"
	"${pkgname}_${pkgver}_Source.tar.bz2.sig::https://sourceforge.net/projects/${pkgname}/files/${_pkgname} ${pkgver}/${pkgname}_${pkgver}_Source.tar.bz2.sig/download"
	"0001_no_makeself.patch"
	"0002_gcc5_invalid_chars.patch"
        "veracrypt.desktop"
        "veracrypt.install")
sha1sums=('cd27cf9b6853aac104a33fac0f1d8733765042ba'
          'cbe620297486c32d1f6a1693f6f2136097644287'
          '0cbe9f7875ab52be125cc575533f76fab60314a5'
          '8379455e17745f0a0f3f70050c5af1c5e127f63b'
          'ebdd450e719fe3cff5e459f027856cbaf03db13a'
          '14dceabf658a7e3505c855c2862aa86e343fcda5')
validpgpkeys=('993B7D7E8E413809828F0F29EB559C7C54DDD393')

prepare() {
  cd ${srcdir}/src

  msg2 "Applying patches..."
  patch -Np1 -i ../0001_no_makeself.patch  # disable sfx archive
  patch -Np1 -i ../0002_gcc5_invalid_chars.patch  # compatibility with new gcc5 ABI
}

build() {
  cd ${srcdir}/src

  msg2 "Building veracrypt..."
  export WX_CONFIG=/usr/bin/wx-config
  make LFLAGS+="-ldl"
}

package() {
  cd ${srcdir}/src
#  cd "${srcdir}"
#  install -D -m755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
#  install -D -m644 "${srcdir}/usr/share/veracrypt/doc/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
#  install -D -m644 "${srcdir}/usr/share/pixmaps/veracrypt.xpm" "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
#  install -D -m644 "${srcdir}/usr/share/applications/veracrypt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 Resources/Icons/VeraCrypt-48x48.xpm "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
