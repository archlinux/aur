# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kevin Dodd <jesin00@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=mathjax2
pkgver=2.7.9
pkgrel=2
pkgdesc='An open source JavaScript display engine for mathematics that works in all modern browsers'
url='https://www.mathjax.org/'
arch=(any)
license=(Apache-2.0)
makedepends=(git)
source=(git+https://github.com/mathjax/MathJax#tag=$pkgver)
sha256sums=('b6ef77c248f9b8b827da55f7520bf003048cd20b2ecc5fd83d8ee5b7d6c3046e')

prepare() {
  cd MathJax

# Remove unneeded stuff, see https://github.com/mathjax/MathJax-docs/wiki/Guide%3A-reducing-size-of-a-mathjax-installation
  rm -r docs test unpacked
  rm -r fonts/HTML-CSS/TeX/png
  for _format in eot otf svg ; do
   find . -type d -name "$_format" -prune -exec rm -rf {} \;
  done
}

package() {
  mkdir -p "$pkgdir"/usr/share/{fonts,licenses/mathjax2}
  cp -a MathJax "$pkgdir"/usr/share/mathjax2
  mv "$pkgdir"/usr/share/mathjax2/fonts "$pkgdir"/usr/share/fonts/mathjax2
  ln -s /usr/share/fonts/mathjax2 "$pkgdir"/usr/share/mathjax2/fonts
  mv "$pkgdir"/usr/share/mathjax2/LICENSE "$pkgdir"/usr/share/licenses/mathjax2/
  rm -r "$pkgdir"/usr/share/mathjax2/.git
}
