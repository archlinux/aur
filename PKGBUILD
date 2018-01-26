# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=ranger-w3m-memleak-fix
_pkgname=ranger
pkgver=1.8.1
pkgrel=1
pkgdesc='A simple, vim-like file manager, with patch to help w3m memory leak'
arch=('any')
url='http://ranger.nongnu.org'
license=('GPL')
depends=('python')
provides=('ranger')
conflicts=('ranger')
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
    'w3m: for previews of images and html pages')

source=("http://ranger.nongnu.org/${_pkgname}-${pkgver}.tar.gz"
        "http://ranger.nongnu.org/${_pkgname}-${pkgver}.tar.gz.sig"
	"w3m.patch")
sha256sums=('1433f9f9958b104c97d4b23ab77a2ac37d3f98b826437b941052a55c01c721b4'
            'SKIP'
            'bcf95b349b38907b73000dae3e2e7f3448109b044a0711529e99c0dcebb83250')
validpgpkeys=('1E9B36EC051FF6F7FFC969A7F08CE1E200FB5CDF') # huterich

package() { 
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../w3m.patch # patch for w3m memory leak
  
  # Replace "python" with the python binary you want ranger to use!
  # (python 2.6 and >=3.1 supported, below 2.6 will certainly not work.)
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
