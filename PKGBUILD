# Maintainer: chrhasse <hasse dot christopher at gmail dot com>
pkgname=ranger-sixel-git
_pkgname=ranger-git
pkgver=1.9.3.663.g478d5b62
pkgrel=1
pkgdesc="Sixel has been merged into main, use ranger-git"
arch=('any')
url="https://github.com/ranger/ranger/pull/2466"
license=('GPL')
depends=('python') #python(>=2.6 or >=3.1)
makedepends=('git' 'python-setuptools')
optdepends=('atool: for previews of archives'
            'file: for determining file types'
            'highlight: for syntax highlighting of code'
            'libcaca: for ASCII-art image previews'
            'mediainfo: for viewing information about media files'
            'perl-image-exiftool: for viewing information about media files'
            'poppler: for pdf previews'
            'python-bidi: for bidi algorithm support'
            'python-chardet: in case of encoding detection problems'
            'python-ueberzug: w3mimgdisplay alternative'
            'sudo: to use the "run as root"-feature'
            'transmission-cli: for viewing bittorrent information'
            'w3m: for previews of images and html pages'
            'imagemagick: for sixel image previews')
provides=('ranger')
conflicts=('ranger')
source=("$_pkgname::git+https://github.com/ranger/ranger"
        "notify.install")
md5sums=('SKIP'
         'b34d9cd9fde59415ab2debcf4b6c7442')
install='notify.install'

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py -q install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${_pkgname%-*}/LICENSE
}

