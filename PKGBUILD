# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=2.0.7
pkgrel=2
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('zlib' 'pcre')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        pyint_fromsize_t.diff
        upstream_r13128.diff)
sha1sums=('307020fb6437092e32c9c1bd9af8bccb1645b529'
          '59ee179b57920d255c58afe45632b896e40b5b7d'
          '8f0c5ae6a46c22606cc88c649bfd0a31f061a963')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # FS#30624
  patch -Np1 -i ../pyint_fromsize_t.diff

  # Fix call to Swig_name_decl
  patch -Np1 -i ../upstream_r13128.diff

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
