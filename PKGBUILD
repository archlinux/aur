# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=pdfposter
pkgver=0.6.0dev
pkgrel=4
pkgdesc="Print large posters on multiple sheets"
arch=('any')
url="https://build.opensuse.org/package/show?package=pdfposter&project=devel%3Alanguages%3Apython"
license=('GPL3')
depends=('python2-pypdf')
makedepends=('python2-distribute')
options=(!emptydirs)
source=(
  "https://api.opensuse.org/public/source/devel:languages:python/pdfposter/pdftools.pdfposter-0.6.0dev.tar.bz2"
  "https://build.opensuse.org/source/devel:languages:python/pdfposter/notrim_option.patch"
  "https://build.opensuse.org/source/devel:languages:python/pdfposter/overlap_option.patch"
  "https://build.opensuse.org/source/devel:languages:python/pdfposter/xy_offset.patch"
)
sha256sums=(
  '76a85bc108ed57be3a012ed479e20de7a76a247cc842ebbcd8fec5de9b7b13f6'
  '679236f7788005861475653b738c1bca326d3a5a19ccaef6faa98d31ac3b9a13'
  'ba482feebf88e1882967cc98e0ca8c58a623086b1a5b71d1081b8394a764cd93'
  'a23b0a9d0ece074127a0bcc6a266b133a6828165e6966ba7cffb809209edd13d'
)

prepare() {
  cd "${srcdir}/pdftools.pdfposter-${pkgver}"
  msg "Patching files with notrim_option.patch ..."
  patch -p1 < "${srcdir}/notrim_option.patch"
  msg "Patching files with overlap_option.patch ..."
  patch -p1 < "${srcdir}/overlap_option.patch"
  msg "Patching files with xy_offset.patch ..."
  patch -p0 < "${srcdir}/xy_offset.patch"
}

package() {
  cd "${srcdir}/pdftools.pdfposter-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
