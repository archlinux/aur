# maintainer: novenary <streetwalkermc@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Previous maintainer: Roman Zimbelmann <romanz@lavabit.com>

_pkgname=ranger
pkgname=ranger-sixel
pkgver=1.9.3
pkgrel=1
pkgdesc='Simple, vim-like file manager, with PR 2234 for sixel image support'
arch=('any')
url='https://ranger.github.io'
license=('GPL')
depends=('python')
optdepends=(
    'atool: for previews of archives'
    'elinks: for previews of html pages'
    'ffmpegthumbnailer: for video previews'
    'highlight: for syntax highlighting of code'
    'libcaca: for ASCII-art image previews'
    'lynx: for previews of html pages'
    'mediainfo: for viewing information about media files'
    'odt2txt: for OpenDocument texts'
    'perl-image-exiftool: for viewing information about media files'
    'poppler: for pdf previews'
    'python-chardet: in case of encoding detection problems'
    'sudo: to use the "run as root"-feature'
    'transmission-cli: for viewing bittorrent information'
    'ueberzug: for previews of images'
    'w3m: for previews of images and html pages')
checkdepends=('python-pytest')
conflicts=('ranger')
provides=('ranger')
source=(https://ranger.github.io/${_pkgname}-${pkgver}.tar.gz{,.sig}
        'ranger_sixel.patch::https://github.com/3ap/ranger/compare/cd17ea8c1d2cd89754f625df25134f00c7227b65...c7dab8c8dba2ed54821f5b016475fa196f887d0f.patch')
sha512sums=('5cd7bea714a6542d0a5445f5f0cf929b2df4377df3ef710f3786c6c46dd58b017a8060cde3969076637bfaac03c13297d3020fd82f4574dc49546ca223c0e8d3'
            'SKIP'
            '28f05be4fa5be00ff8ed2a079ec5d0537c96cf3e829e1368fdc793d54e764bccca4a4e3d8e4156d02877276f455b6868abe0fca21c52a96516667afa87f54661')
validpgpkeys=('1E9B36EC051FF6F7FFC969A7F08CE1E200FB5CDF'
              '66FA95C0F1619BDA520A41F60D63346A5D15D055') # huterich

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i ../ranger_sixel.patch
}

check() {
  cd ${_pkgname}-${pkgver}
  make test_pytest
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
