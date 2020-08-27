# $Id: PKGBUILD 362427 2018-07-19 17:42:59Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kevin Dodd <jesin00@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=mathjax2
pkgver=2.7.9
pkgrel=1
pkgdesc='An open source JavaScript display engine for mathematics that works in all modern browsers'
url='https://www.mathjax.org/'
arch=(any)
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathjax/MathJax/archive/$pkgver.tar.gz")
sha256sums=('c9167279c87da044f2ff910ad573a02ce90354cb59440ae568eb86e1630f65df')

prepare() {
  cd MathJax-$pkgver

# Remove unneeded stuff, see https://github.com/mathjax/MathJax-docs/wiki/Guide%3A-reducing-size-of-a-mathjax-installation
  rm -r docs test unpacked
  rm -r fonts/HTML-CSS/TeX/png
  for _format in eot otf svg ; do
   find . -type d -name "$_format" -prune -exec rm -rf {} \;
  done
}

package() {
  mkdir -p "$pkgdir"/usr/share/{fonts,licenses/mathjax2}
  cp -a MathJax-$pkgver "$pkgdir"/usr/share/mathjax2
  mv "$pkgdir"/usr/share/mathjax2/fonts "$pkgdir"/usr/share/fonts/mathjax2
  ln -s /usr/share/fonts/mathjax2 "$pkgdir"/usr/share/mathjax2/fonts
  mv "$pkgdir"/usr/share/mathjax2/LICENSE "$pkgdir"/usr/share/licenses/mathjax2/
}
