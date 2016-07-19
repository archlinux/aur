# Maintainer: Jan Holthuis <holthuis.jan@gmail.com>

pkgname=rubtexfonts2009
pkgver=0.0.20120318
pkgrel=1
pkgdesc="Fonts for the Corporate Design of the Ruhr-University of Bochum. You need to download the files manually, using your LoginID from: https://noc.rub.de/~jobsanzl/latex/rubtexfonts-latest.tar.gz"
arch=('any')
url="https://noc.rub.de/~jobsanzl/latex/"
license=('unknown')
depends=('texlive-core' 'texlive-fontsextra')
install=$pkgname.install
source=("rubtexfonts-latest.tar.gz::file://rubtexfonts-latest.tar.gz")
sha256sums=('c6a08662ee21f96a5ae1ea0b7d074e87e4bfa9476af2ef31429be4ab09bc479c')

package() {
  TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
  install -d -m755 "${pkgdir}/${TEXMFDIST}"

  for subdir in "doc" "tex" "fonts" "source"; do
    cp -r "${subdir}" "${pkgdir}/${TEXMFDIST}/${subdir}"
  done

  cd "${pkgdir}/${TEXMFDIST}"
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}
