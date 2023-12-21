# Maintainer: jlaunay
pkgname=neuropolitical-otf
pkgver=1.0
pkgrel=1
url="http://www.dafont.com/neuropolitical.font"
license=('custom')
pkgdesc="Neuropolitical custom font"
arch=('any')
source=("neuropolitical.zip::http://dl.dafont.com/dl/?f=neuropolitical")

md5sums=('3517c813dd8492383bbe902df2d741dd')

prepare() {
  mv "neuropolitical rg.otf" "Neuropolitical-R.otf"
}

package()
{
  mkdir -p $pkgdir/usr/share/fonts/otf-neuropolitical
  install -Dm 644 $srcdir/*.otf $pkgdir/usr/share/fonts/otf-neuropolitical/
  install -Dm 644 $srcdir/read-this.html ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html
  install -Dm 644 "$srcdir/Typodermic Desktop EULA 2023.pdf" ${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf
}

post_install()
{
  echo -n "Updating font cache... "
  fc-cache -fs >/dev/null
  mkfontscale /usr/share/fonts/otf-neuropolitical
  mkfontdir /usr/share/fonts/otf-neuropolitical
  echo "done"
}

post_upgrade()
{
  post_install
}
