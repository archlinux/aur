# Maintainer: Ilya Kovalenko <agentsib@gmail.com>

pkgname=joxi
pkgver=2.4.0
pkgrel=3
pkgdesc="Easy to use screenshot sharing application (Russian)"
arch=('i386' 'x86_64')
url="http://joxi.ru/"
license=('unknown')
options=('emptydirs')
depends=('qt4' 'libpng12' 'quazip' 'opencv' 'openssl098')

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=(
			'9be5f0051b4d2c8ae0669115ccb74d17'
			'66ef866e3fe32bbfd9eb72fe5ce02b7e'
			'93274063806e203654b13884b6e6871c'
		  )

elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
  md5sums=(
            '3606c1987b4707499ece7cf5d915358d'
			'66ef866e3fe32bbfd9eb72fe5ce02b7e'
			'93274063806e203654b13884b6e6871c'
          )
fi

source=("http://bc.cdn.joxi.ru/download/${pkgname}_${ARCH}.deb" "${pkgname}.desktop" "${pkgname}.sh")
package(){
   ar -x "${srcdir}/${pkgname}_${ARCH}.deb"
   tar -zxf "${srcdir}/data.tar.gz"
   mkdir -p ${srcdir}/usr/lib/joxi
   ln -s /usr/lib/libcrypto.so.0.9.8 ${srcdir}/usr/lib/joxi/libcrypto.so.1.0.0 
   ln -s /usr/lib/libssl.so.0.9.8 ${srcdir}/usr/lib/joxi/libssl.so.1.0.0 

   install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/joxi"
   install -d "${pkgdir}/usr/lib/joxi"
   install -D -m755 "${srcdir}/usr/bin/joxi" "${pkgdir}/usr/lib/joxi/joxi"

   ln -s /usr/lib/libcrypto.so.0.9.8 ${pkgdir}/usr/lib/joxi/libcrypto.so.1.0.0 
   ln -s /usr/lib/libssl.so.0.9.8 ${pkgdir}/usr/lib/joxi/libssl.so.1.0.0 

   install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
   install -D -m644 "${srcdir}/opt/joxi/icon_64.png" "${pkgdir}/usr/share/pixmaps/joxi.png"
   install -D -m644 "${srcdir}/usr/share/doc/joxi/doc/analytics/protocol" "${pkgdir}/usr/share/doc/joxi/doc/analytics/protocol"
}
