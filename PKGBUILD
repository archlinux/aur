# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=repeatmasker
pkgver=4.0.5
pkgrel=1
pkgdesc="Screen DNA sequences for interspersed repeats and low complexity DNA sequences"
arch=('any')
url="http://www.repeatmasker.org/"
license=('custom')
depends=('perl' 'hmmer' 'rmblast' 'trf' 'perl-text-soundex')
source=('http://www.repeatmasker.org/RepeatMasker-open-4-0-5.tar.gz')
md5sums=('6dd3a49044ff288f3c7d30f1ce61e418')
install='repeatmasker.install'

package() {
  cd "${srcdir}"/RepeatMasker
  install -d "${pkgdir}"/usr/share/licenses/repeatmasker
  install -D -m644 license.txt "${pkgdir}"/usr/share/licenses/repeatmasker/LICENSE

  install -d "${pkgdir}"/usr/lib/RepeatMasker
  find . -type d -exec install -d "${pkgdir}"/usr/lib/RepeatMasker/'{}' \;
  find . -type f \! -executable -exec install -D -m644 '{}' "${pkgdir}"/usr/lib/RepeatMasker/'{}' \;
  find . -type f -executable -exec install -D -m755 '{}' "${pkgdir}"/usr/lib/RepeatMasker/'{}' \;

  install -d "${pkgdir}"/usr/bin
  ln -sf /usr/lib/RepeatMasker/RepeatMasker "${pkgdir}"/usr/bin/RepeatMasker
}
