# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Elena ``of Valhalla'' Grandi <gmail.com: elena.valhalla>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor: bohoomil <@zoho.com>

pkgbase=font-symbola
pkgname=('otf-symbola' 'ttf-symbola')
pkgver=14.00
pkgrel=2
pkgdesc='Font for symbol blocks of the Unicode Standard'
arch=(any)
url='https://dn-works.com/ufas/'
license=(custom)
makedepends=(fontforge
             poppler)
_srcurl='https://web.archive.org/web/20240107144224/'
source=("$pkgbase-$pkgver-$pkgrel.pdf::${_srcurl}https://dn-works.com/wp-content/uploads/2021/UFAS121921/Symbola.pdf"
        "License-$pkgver-$pkgrel.pdf::${_srcurl}https://dn-works.com/wp-content/uploads/2021/UFAS121921/License.pdf")
sha512sums=('7e48bc125df8f2f3d7bfeb849bb4216cfb762ae13f55f0d165e2947595491571cf8fb5ed3cbf06c4fe8ac3fde844d18e19d745bd25bd74297e5e0c608f810079'
            '29b7ae4fef078fbf266e0bff75bace6c146ad6bb5d7586b950eb8d29faae2aa612673a199c5a82b3807a26e7bff7d9963f0d174963b41c7ff47f25a6c5c9419d')

prepare() {
  pdfdetach -saveall ${source[0]%::*}
}

build() {
  fontforge -c 'open(argv[1]).generate(argv[2])' Symbola.{otf,ttf}
  pdftotext "${source[1]%::*}" LICENSE
}

package_otf-symbola() {
  provides=('font-symbola')
  pkgdesc+=' (OTF)'
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" Symbola.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_ttf-symbola() {
  conflicts=('ttf-symbola-ib<=13.00')
  provides=('font-symbola')
  pkgdesc+=' (TTF)'
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" Symbola.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
