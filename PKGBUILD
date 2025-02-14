# Maintainer: Kevin Jilissen <info@kevinjilissen.nl>

pkgname=mcrl2-bin
pkgver=202407.1
pkgrel=2
pkgdesc="A formal specification language with an associated toolset installed from the 'deb' GitHub release package."
arch=('x86_64')
provides=('mcrl2')
conflicts=('mcrl2')
depends=('qt6-base' 'glu' 'hicolor-icon-theme')
optdepends=('python: for easily running the included examples')
url=https://www.mcrl2.org
license=('Boost')
source=("https://github.com/mCRL2org/mCRL2/releases/download/mcrl2-${pkgver}/mcrl2-${pkgver}_${arch}.deb" "desktop-files.tgz")
sha256sums=('3d48bbbe3beee59a05f6eee7bc3588b5ce1ec45fcbecb171c7fe736a44d3db55' SKIP)
install=mcrl2.install


build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.gz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  # Fix for https://github.com/mCRL2org/mCRL2/issues/1804
  tar -xvf "${srcdir}/desktop-files.tgz" -C "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}"/usr/bin
}
