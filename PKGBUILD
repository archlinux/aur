# Maintainer:  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=3.11.0
pkgrel=1
epoch=
pkgdesc="A simple screenshot tool supporting multiple backends"
arch=('any')
url="https://github.com/thenaterhood/gscreenshot"
license=('GPL')
groups=()
depends=("python"
        "python-pillow"
        "scrot"
        "gtk3"
        "python-setuptools"
        "python-gobject"
        "slop")
makedepends=("fakeroot"
        "gettext"
        "python-build"
        "python-installer"
        "python-wheel")
checkdepends=()
optdepends=('xclip: command line clipboard support'
            'xdg-utils: for opening screenshot files from gscreenshot'
            'pandoc: for generating the manpage at build (or use go-md2man)'
            'go-md2man: for generating the manpage at build (or use pandoc)'
            'slurp: for region selecton on Wayland'
            'wl-clipboard: Wayland clipboard support'
            'python-dbus: required when using the XDG desktop portal backend')
provides=()
conflicts=('gscreenshot-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/thenaterhood/gscreenshot/archive/v$pkgver.tar.gz")
sha256sums=('a78e89e890b33636d6c0df7f61a3ced03764cf02b37f070f5b64b2b8025fbde6')
validpgpkeys=()

prepare() {
        cd $srcdir/gscreenshot-$pkgver
}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

check() {
        echo "Nothing to check"
}

package() {
        cd $srcdir/gscreenshot-$pkgver
        python -m installer --destdir="$pkgdir" dist/*.whl
        chmod +x "$pkgdir/usr/bin/gscreenshot"
        chmod +x "$pkgdir/usr/bin/gscreenshot-cli"
}
