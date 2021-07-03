# Maintainer: willemw <willemw12@gmail.com>
# Contributor: B4SH-B00STER

pkgname=youtube-dl-gui-git
pkgver=1.7.0.r12.g8dbf054
pkgrel=1
pkgdesc="Cross platform front-end GUI of the popular youtube-dl written in wxPython"
arch=('any')
url="https://github.com/oleksis/youtube-dl-gui"
license=('custom:UNLICENSE')
# xdg-utils: xdg-open to open and play a file
depends=('python-pypubsub' 'python-wxpython' 'xdg-utils')
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the program downloaded by youtube-dl-gui')
makedepends=('git' 'python-polib' 'python-setuptools')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git
        youtube-dl-gui.desktop)
sha256sums=('SKIP'
            '0c98a9550084bf7b9fd1ac9c394c6499a129b9d439bab6a256b3a1f4695ce358')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#build() {
#  cd $pkgname
#  python setup.py build build_trans
#}

package() {
  install -Dm644 youtube-dl-gui.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  cd $pkgname
  python setup.py build_trans install --root="$pkgdir" --optimize=1    # --skip-build
}



#  # Following the upstream build instructions
#  # Change the Exec= line in youtube-dl-gui.desktop to Exec=youtube-dl-gui
#
#  pkgname=youtube-dl-gui-git
#  pkgver=0
#  pkgrel=1
#  pkgdesc="Cross platform front-end GUI of the popular youtube-dl written in wxPython"
#  arch=('any')
#  url="https://github.com/oleksis/youtube-dl-gui"
#  license=('custom:UNLICENSE')
#  # wxgtk3 is a wxpython dependency (see package python-wxpython)
#  # xdg-utils: xdg-open to open and play a file
#  depends=('wxgtk3' 'xdg-utils')
#  optdepends=('ffmpeg: convert video files to audio-only files'
#              'youtube-dl: alternative to the program downloaded by youtube-dl-gui')
#  makedepends=('git')
#  provides=(${pkgname%-git})
#  conflicts=(${pkgname%-git})
#  source=($pkgname::git+$url.git
#          youtube-dl-gui.desktop
#          youtube-dl-gui)
#  sha256sums=('SKIP'
#              '0'
#              '0')
#
#  pkgver() {
#    git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#  }
#
#  #check() {
#  #  cd $pkgname
#  #
#  #  source venv/bin/activate
#  #  make test
#  #}
#
#  package() {
#    install -Dm755 youtube-dl-gui -t "$pkgdir/usr/bin"
#    install -Dm644 youtube-dl-gui.desktop -t "$pkgdir/usr/share/applications"
#    install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
#
#    cd $pkgname
#
#    export PIP_CONFIG_FILE=/dev/null
#    export TMPDIR="$srcdir/tmp"
#    export XDG_CACHE_HOME="$srcdir/cache"
#
#    mkdir -p "$TMPDIR"
#
#    make clean-requirements
#    make venv
#    source venv/bin/activate
#    make install
#
#    rm -rf "$TMPDIR"
#
#    install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
#    cp -a venv "$pkgdir/usr/share/${pkgname%-git}"
#  }

