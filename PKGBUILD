# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname="rimsort-git"
pkgver=r310.6db22ad
pkgrel=1
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
makedepends=(python)
depends=(
    "python"
    "python-beautifulsoup4"
    "python-imageio"
    "python-loguru"
    "python-lxml"
    "python-natsort"
    "python-platformdirs"
    "python-pygithub"
    "python-pyperclip"
    "pyside6"
    "python-psutil"
    "python-pytz"
    "python-requests"
    "python-steam"
    "python-toposort"
    "python-watchdog"
    "python-xmltodict"
    "nuitka"
)
source=("git+https://github.com/RimSort/RimSort.git"
        "RimSort.desktop"
        "RimSort.sh")
sha512sums=('SKIP'
            '99c94e26aedc457bcb4ecfa6f3a3826177cdc93fcedf9826080d23f040d99af7185ea81b9b0144d8c5bbd3b655dfb59eec5c769de5f44088f4ed8f3681e36f96'
            '6d4ffba79de38bc652710d0fb22bc61706b410a70d652362e5da02657a6d7643f8419e66237e5f21e3b6192b97fa46cb0230a660a516584dc5c7b750813653ed')

OPTIONS=(!strip)

pkgver() {
    cd "$srcdir/RimSort"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/RimSort"
    python distribute.py
}

package() {
    cd "$srcdir/RimSort/build/__main__.dist"

    # Main Files
    install -dm755 "$pkgdir/opt/rimsort/"
    cp -r ./* "$pkgdir/opt/rimsort/"

    # Icon
    install -Dm644 "./themes/default-icons/AppIcon_a.png" "$pkgdir/usr/share/pixmaps/RimSort.png"

    # Desktop File
    install -Dm644 "$srcdir/RimSort.desktop" "$pkgdir/usr/share/applications/RimSort.desktop"

    # Launch Script
    install -Dm755 "$srcdir/RimSort.sh" "$pkgdir/usr/bin/RimSort"
}
