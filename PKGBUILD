# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ott
pkgver=0.25
pkgrel=1
pkgdesc="Ott, a tool for writing definitions of programming languages and calculi"
arch=('i686' 'x86_64')
url="http://www.cl.cam.ac.uk/~pes20/ott"
license=('custom:BSD3')
depends=('glibc' 'ocaml' 'texlive-core')
source=("http://www.cl.cam.ac.uk/~pes20/ott/ott_distro_$pkgver.tar.gz"
        "http://www.cl.cam.ac.uk/~pes20/ott/ott_manual_$pkgver.pdf")

md5sums=('9c0202860ad3de84042f6e9feafd15bd'
         'a37ec69b695c83df172457c5497ac60d')

build() {
  cd "ott_distro_$pkgver"
  make world || return 1
}

package() {
  cd "$srcdir/ott_distro_$pkgver"
  install -D -m 755 bin/ott ${pkgdir}/usr/bin/ott
  install -D -m 644 LICENCE ${pkgdir}/usr/share/licenses/ott/LICENCE
  install -D -m 644 tex/ottlayout.sty \
    ${pkgdir}/opt/texlive/texmf-local/tex/latex/$pkgname/ottlayout.sty
  cd $srcdir
  install -D -m 644 ott_manual_$pkgver.pdf ${pkgdir}/usr/share/doc/ott/ott_manual.pdf
}

