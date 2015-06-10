# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Kwpolska <kwpolska@kwpolska.tk>
# Contributor: Eric Mertens <emertens@gmail.com>

pkgname=fondu
pkgver=060102
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Mac font conversion utility"
url="http://fondu.sourceforge.net/"
license=('BSD')
source=("http://fondu.sourceforge.net/fondu_src-$pkgver.tgz"
        "makefile.patch")
sha256sums=('22bb535d670ebc1766b602d804bebe7e84f907c219734e6a955fcbd414ce5794'
            'c6390af3ba4daecf7d548d0f0c46e691444fa31ba67f530e5354720288314f6b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  chmod +w Makefile
  patch Makefile ../makefile.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  # move everything in /bin to /usr/bin
  cd "${pkgdir}"
  mv bin usr
}
