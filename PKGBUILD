# Maintainer: Ralph Amissah <ralph.amissah@gmail.com>
# sisu
# SET pkgver & sha256sums
pkgname=('sisu')
pkgdesc="documents - structuring, publishing in multiple formats & search"
pkgver=7.1.7
pkgrel=1
source=("http://www.sisudoc.org/sisu/archive/pool/main/s/sisu/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('a8a1abd1d8eca77a3bc300aa147b568d1322496999412be26e1586f8adec1a1e')
arch=('any')
url="http://sisudoc.org"
license=('GPL3')
depends=('ruby')
makedepends=('ruby')
optdepends=(
  'zip: epub & odf:odt files'
  'unzip: epub & odf:odt files (not required)'
  'tree: report directory structure'
  'imagemagick: image support'
  'graphicsmagick: image support'
  'texlive-core: pdf'
  'texlive-latexextra: pdf'
  'texlive-fontsextra: pdf'
  'texlive-langcjk: pdf Chinese Japanese Korean (large optional dependency, comment out if not needed)'
  'sqlite: search, populate sqlite db'
  'ruby-sqlite3: search, populate sqlite db'
  'postgresql: search, populate postgresql db'
  'ruby-pg: search, populate postresql db'
  'ruby-fcgi: search, sample search form'
  'qrencode: qrcodes based on document metadata'
  )
conflicts=('sisu-gem' 'sisu-git' 'sisu-git-gem')
options=(!emptydirs)
install=
changelog=
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  msg "Configuring source..."
  local _rblib="$(ruby -e"require 'rbconfig';print RbConfig::CONFIG['vendorlibdir'].gsub(/^\//,'')")"
  ruby ./setup.rb config --prefix=${pkgdir}/usr \
    --siterubyver=${pkgdir}/${_rblib} \
    --sysconfdir=${pkgdir}/etc
  msg "Running setup..."
  ruby ./setup.rb setup
}
package() {
  msg "Installing files..."
  cd "${srcdir}/${pkgname}-${pkgver}"
  ruby ./setup.rb install
}
