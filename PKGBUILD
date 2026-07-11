pkgname=gscreenshot-git
pkgver=2.16.2.255.g9509509
pkgrel=1
epoch=
pkgdesc="A simple screenshot tool supporting multiple backends. Git version, with wayland support"
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
        "python-dbus"
        "slop"
        "slurp"
        )
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
            'wl-clipboard: Wayland clipboard support')
provides=('gscreenshot')
conflicts=('gscreenshot')
source=("git+https://github.com/thenaterhood/gscreenshot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gscreenshot"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g' || \
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/gscreenshot"
        python -m build --wheel --no-isolation
}

package() {
        cd $srcdir/gscreenshot
        python -m installer --destdir="$pkgdir" dist/*.whl
        chmod +x "$pkgdir/usr/bin/gscreenshot"
        chmod +x "$pkgdir/usr/bin/gscreenshot-cli"
}
