# Maintainer: Raphael Freudiger <laser_b at gmx dot ch>
pkgname=chromecastize-git
pkgver=43.ef7305a
pkgrel=1
pkgdesc="Bash script to convert video files into Google Chromecast supported format."
arch=('any')
url="https://github.com/bc-petrkotek/chromecastize"
license=('GPL')
depends=('ffmpeg' 'mediainfo')
makedepends=('git')
source=('git+https://github.com/bc-petrkotek/chromecastize.git'
        'https://patch-diff.githubusercontent.com/raw/bc-petrkotek/chromecastize/pull/25.patch')
md5sums=('SKIP'
         '1b3bc12dbeabf8dbaa5b148d9c77296e')

pkgver() {
    cd "chromecastize"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/chromecastize"

    git apply ../25.patch
}

package() {
    cd "$srcdir/chromecastize"

    install -d "$pkgdir/usr/bin/"
    install -t "$pkgdir/usr/bin/" chromecastize.sh
}
