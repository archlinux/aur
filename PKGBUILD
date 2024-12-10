# Maintainer: envolution
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Kwpolska <kwpolska@kwpolska.tk>
# Contributor: Eric Mertens <emertens@gmail.com>

pkgname=fondu
pkgver=060102
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="Mac font conversion utility - debian patches"
url="http://fondu.sourceforge.net/"
license=('BSD')
source=("http://fondu.sourceforge.net/fondu_src-$pkgver.tgz"
  10-escape-minus-sign-in-manpage.patch
  20-fix-manpage-quoting.patch
  30-fix-spelling-errors-in-binary.patch
  40-use-destdir.patch
  51-fix-hardening-build.patch
  60-missing-printf-arguments.patch
  70-fix-spelling-errors-in-binary.patch
  80-fix-cflags-in-makefile.patch
)
sha256sums=('22bb535d670ebc1766b602d804bebe7e84f907c219734e6a955fcbd414ce5794'
            'e8592e5c5896475c80832c647d33d2857e528f080e3703a1325db3153e0a160e'
            'baafd24033abc4f7a61f8d83b954462d6a97709b552aba56e27f0d4eb83b711a'
            '7741cd0d729ffcdfa1730c3d97018419f2d9aaeca83016e84bb0f48b4cb5a6e1'
            '043e3c2fe3c02dd6bf87babd08dc98151f29b5d0eeb559d9cebb9a713e8923ff'
            '87aea83163fef74e69b139b62989265358114f4ce49888acb4e648b55b8e9474'
            '031ae4063da7686b61c190ba945bd1749cf2bdc1568814a81d42c15051e6fa57'
            '5591a31d7212af7b77cf9360e323d9b96fee9a48e3521509830b05198c333c80'
            '934f8f24248e29a69b3fca7334c45b5e8c3fa5d7bc96c90d2ed80be1b1cc93ac')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../10-escape-minus-sign-in-manpage.patch
  patch -Np1 -i ../20-fix-manpage-quoting.patch
  patch -Np1 -i ../30-fix-spelling-errors-in-binary.patch
  patch -Np1 -i ../40-use-destdir.patch
  patch -Np1 -i ../51-fix-hardening-build.patch
  patch -Np1 -i ../60-missing-printf-arguments.patch
  patch -Np1 -i ../70-fix-spelling-errors-in-binary.patch
  patch -Np1 -i ../80-fix-cflags-in-makefile.patch

}
build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --bindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
