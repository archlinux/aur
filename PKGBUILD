# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-pine
pkgver=1.13
_pkgtag=$pkgver
pkgrel=1
pkgdesc="Pine is an open world action adventure simulation game."
arch=('x86_64')
url="https://www.gog.com/game/$(echo ${pkgname//-/_} | cut -c 5-)"
license=('custom')
groups=('gog' 'games')
makedepends=('lgogdownloader')
depends=('zlib' 'bash')
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://2065334330/en3installer0"
        "$(echo ${pkgname//-/ } | cut -c 5- | sed 's/[^ ]\+/\L\u&/g').desktop"
        "start-${pkgname:4}.sh")
sha512sums=('c17a8bfb17fb3cf131077f4fc042708d6a1f371fe5d5986dac997c23eb3502d934df8e40e06358db8e39df9386ec91aea06e8d5f2dc7223fcf8b101b5c24600a'
            '9b2d7349865be7f00c08a487c07d176703fcb60248d1859ea7addc248feaf045fe4187a4d9f7ec5dc0a9180e853280a202c2e22a8144ac50071f87c25ac77d67'
            '3f7d1078459365490da30ff839cad9f5bfab37597d07061ff808efe64b883c5b6fc7831510023ed04abc136fb500b4eae41579f3e855119f5564f0e5d9f2d999')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/$pkgname"
  mv "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
  chmod -R 644 "${pkgdir}/opt/$pkgname/"
	chmod    755 "${pkgdir}/opt/$pkgname/Pine.x86_64"
  find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/start-${pkgname:4}.sh" "${pkgdir}/usr/bin/${pkgname:4}"
  install -Dm 755 "${srcdir}/$(echo ${pkgname//-/ } | cut -c 5- | sed 's/[^ ]\+/\L\u&/g').desktop" "$pkgdir/usr/share/applications/$(echo ${pkgname//-/ } | cut -c 5- | sed 's/[^ ]\+/\L\u&/g').desktop"
  install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
