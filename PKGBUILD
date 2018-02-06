# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-git
pkgver=master.lmde3.r0.ga5bf0159
pkgrel=1
pkgdesc="Cinnamon file manager, git-version"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo"
_branch='master'
license=('GPL')
depends=('cinnamon-desktop'
    'cinnamon-translations'
    'dconf'
    'desktop-file-utils'
    'exempi'
    'gvfs'
    'libexif'
    'libnotify'
    'libxml2'
    'python'
    'xapps')
makedepends=('git'
    'gnome-common'
    'gobject-introspection'
    'gtk-doc'
    'intltool'
    'meson'
    'python-gobject'
    'python2-gobject'
    'python-polib')
optdepends=('ffmpegthumbnailer: support for video thumbnails')
conflicts=('nemo')
provides=('nemo')
options=('!emptydirs')
source=("git+https://github.com/linuxmint/nemo#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i 's/^Name\(.*\)=.*/Name\1=Nemo/' nemo/data/nemo.desktop.in
}

build() {
  cd nemo
  meson --buildtype plain build --prefix=/usr
}

package() {
  cd $srcdir/nemo
  DESTDIR="$pkgdir" ninja -C build install
}
