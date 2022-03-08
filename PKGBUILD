# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname='html2text-cpp'
_pkgname='html2text'
pkgver=r91.49db615
pkgrel=1
pkgdesc='A C/C++ based HTML to text converter'
arch=('i686' 'x86_64')
url='http://www.mbayer.de/html2text'
license=('GPL2')
depends=('gcc-libs')
source=("git+https://github.com/grobian/${pkgname%%-*}.git")
sha1sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  sed -e 's/html2textrc/html2text-cpprc/g' -i html2text.cpp

  ./configure
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  gzip -f html2text.1
  gzip -f html2textrc.5

  install -Dpm755 'html2text' "${pkgdir}/usr/bin/html2text-cpp"
  install -Dpm644 'html2text.1.gz' "${pkgdir}/usr/share/man/man1/html2text-cpp.1.gz"
  install -Dpm644 'html2textrc.5.gz' "${pkgdir}/usr/share/man/man5/html2text-cpprc.5.gz"
}
