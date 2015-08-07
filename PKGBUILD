# Maintainer: 2ion <dev@2ion.de>
pkgname=cpdf-bin
pkgver=2.1
pkgrel=3
pkgdesc="Command line tools allowing you to manipulate existing PDF files in a variety of ways"
arch=('x86_64' 'i686')
url="http://community.coherentpdf.com"
license=('custom:eula')
depends=('glibc')
makedepends=('coreutils' 'binutils') # install, strip
provides=('cpdf')
conflicts=('cpdf-git')
replaces=('cpdf-git')

_pkgname=${pkgname%-bin}
_base_url='https://raw.githubusercontent.com/coherentgraphics/cpdf-binaries/master'

source=(\
  "$_base_url/LICENSE" \
  "$_base_url/cpdfmanual.pdf" \
  "$_base_url/LosslessPDFCompressor/smpdfmanual.pdf")
md5sums=(\
  '8d549251f5c121ac09b33161a6254c2a' \
  '743f6b251750c7a9aa36953dfcfbeca8' \
  'df48880c663069d80dd940e05a9f1d86')

source_x86_64=(\
  "$_base_url/Linux-Intel-64bit/cpdf" \
  "$_base_url/LosslessPDFCompressor/Linux64/smpdf")
md5sums_x86_64=(\
  '85b261bb16809a0ecaa6be8120259778' \
  '8f006de7cf1241b0b232aa2812e0066e')

source_i686=(\
  "$_base_url/Linux-Intel-32bit/cpdf" \
  "$_base_url/LosslessPDFCompressor/Linux32/smpdf")
md5sums_i686=(\
  '68c80e2a22dcb70a4f84f6dc917a4fdf' \
  'ca591ee6c0e75f32ecf6e19e4569fd7f')

prepare() {
  cd "$srcdir"
  strip cpdf smpdf
}

package() {
  cd "$srcdir"
  install -Dm755 cpdf             "${pkgdir}/usr/bin/cpdf"
  install -Dm755 smpdf            "${pkgdir}/usr/bin/smpdf"
  install -Dm644 LICENSE          "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 cpdfmanual.pdf   "${pkgdir}/usr/share/doc/${_pkgname}/cpdfmanual.pdf"
  install -Dm644 smpdfmanual.pdf  "${pkgdir}/usr/share/doc/${_pkgname}/smpdfmanual.pdf"
}
