# Maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Contributor: FabioLolix
# Contributor: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
_pkgver=25.01.01061-202501070800
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=(x86_64)
url="https://www.xmind.net"
license=(unknown)
depends=(gtk3 alsa-lib libxkbfile nss)
options=(!strip)

source_x86_64=(
  "https://dl3.xmind.net/Xmind-for-Linux-amd64bit-${_pkgver}.deb" 
  "${pkgname}.desktop" 
  "${pkgname}.sh"
)

sha256sums_x86_64=('329d9a0bfc87a01dbdb7d418e139db827fff27c1a8addb794b526b267d01bd78'
                   '26e0a8e4c7e7bd7f9c46e52f5a80de808566d9619a3df1a83fb4dda916172bae'
                   '686e5f4c0f4b26c9e66903d18550730b7496a155cfe46e2361b7293dd20677eb')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d "$pkgdir/usr/bin"

  # Add custom desktop file
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  # Add custom launcher to allow passing user flags
  install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
