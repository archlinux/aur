# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Justin Kueser < [firstname] dot [lastname] at gmail dot com>

pkgname=lprngtool
pkgver=1.3.2
pkgrel=1
pkgdesc="LPRngTool"
arch=('i686' 'x86_64')
url="http://www.lprng.com"
license=('custom:Artistic')
depends=('tk' 'lprng' 'ifhp')
backup=('etc/lprngtool.conf')
conflicts=()
source=(ftp://ftp.lprng.com/pub/LPRng/LPRngTool/LPRngTool-$pkgver.tgz
"config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD")
sha256sums=('b395d9d1e27b9601c2c5a7a51325a174680ee60cc314bd1e75f129807032961a'
            '6adc41d8d507d6a5dd97847a592a0629292593d5d901a766b530246f4ce847aa')


build() {
  
  cd "${srcdir}/LPRngTool-${pkgver}"

  rm -f config.sub
  cp ../config.sub ./
    ./configure --prefix=/usr --sysconfdir=/etc \
      --mandir=/usr/share/man --libexecdir=/usr/lib/lprngtool \
      --with-filterdir=/usr/lib/ifhp/filters --with-ifhp_path=/usr/lib/ifhp

  make all

}

package() {
  
  cd "${srcdir}/LPRngTool-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
