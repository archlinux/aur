# Maintainer: shmilee <shmilee.zju@gmail.com>
# Maintainer: MJsaka <qiuxuenan@gmail.com>

pkgname=kwplayer-git
_pkgname=kwplayer
pkgver=r519.d623733
pkgrel=1
pkgdesc='An elegant music player which can get songs from kuwo.cn'
arch=('any')
license=('GPL3')
url="https://github.com/LiuLang/kwplayer"
depends=('python-cairo' 'python-html2text' 'python-gobject' 'gtk3' 'python-dbus' 'dbus-glib' 'python-ply'
         'gst-plugins-base' 'gst-plugins-ugly' 'gst-plugins-good' 'gstreamer' 'gst-libav'
         'gnome-icon-theme-symbolic')
optdepends=('python-mutagenx: convert ID3 tag from GBK to UTF-8'
            'plyvel: use leveldb for cache data'
            'python3-keybinder: global keyboard shortcuts')
conflicts=(kwplayer-git)
source=("git://github.com/LiuLang/kwplayer")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir"
    #sed -i 's/Icon=kwplayer/Icon=kwplayer.png/' "$pkgdir"/usr/share/applications/kwplayer.desktop
}


