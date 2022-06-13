# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Ian D. Scott <ian@perebruin.com>
# Contributor: Justin Kueser < [firstname] dot [lastname] at gmail dot com>

pkgname=lprngtool
pkgver=1.3.2
pkgrel=3
pkgdesc="LPRngTool"
arch=('i686' 'x86_64')
url="http://www.lprng.com"
license=('custom:Artistic')
depends=('tk' 'lprng' 'ifhp')
backup=('etc/lprngtool.conf')
source=("http://www.lprng.com/DISTRIB/LPRngTool/LPRngTool-${pkgver}.tgz"
        "config.sub")
sha256sums=('b395d9d1e27b9601c2c5a7a51325a174680ee60cc314bd1e75f129807032961a'
            'deb02c26f43b2ea64276c9ede77ec0f53d08e6256710f3c0a12275712085c348')

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
