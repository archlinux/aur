_pkgname="spicetify-extensions-rxri"
pkgname="$_pkgname-git"
pkgver=r38.66ec39b
pkgrel=2
pkgdesc="Add some spice with extensions to make spotify more enjoyable"
arch=("any")
url="https://github.com/rxri/spicetify-extensions"
license=("MIT")
makedepends=("git")
provides=("$_pkgname" "spicetify-extensions-charlies")
conflicts=("$_pkgname" "spicetify-extensions-charlies")
source=(
    "spicetify-extensions-rxri::git+https://github.com/rxri/spicetify-extensions"
    "$_pkgname.hook"
)
sha256sums=('SKIP'
            '120eecd10a3bb10d557be719a5a7971e6f601d86986ceef4523f6deb926012fe')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=("spicetify-cli")
    cd "$srcdir/$_pkgname"
    local file extension
    for file in ./*/*.js
    do
        extension=$(basename "$file")
        echo "Installing $extension..."
        install -Dm644 "$file" "$pkgdir/opt/spicetify-cli/Extensions/$extension"
    done
    install -Dm644 "$srcdir/$_pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$_pkgname.hook"
}
