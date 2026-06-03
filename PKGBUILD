# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=geary-hide-sidebar-bin
_pkgname=geary-hide-sidebar
pkgver=0.1.2
pkgrel=1
pkgdesc="GTK3 module that hides/collapses Geary's left Mail sidebar (prebuilt binary)"
arch=('x86_64')
url="https://github.com/akitaonrails/geary-hide-sidebar-module"
license=('MIT')
# This prebuilt variant pairs with stable `geary` (the source package
# geary-hide-sidebar pairs with geary-git instead — see its comment).
# Unversioned gtk3/glib2 is sufficient: GTK3's SONAME (libgtk-3.so.0) is
# frozen, so the prebuilt .so links against whatever gtk3 is installed.
depends=('geary' 'gtk3' 'glib2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$_pkgname.install"
# Prebuilt: nothing to strip, and there are no debug symbols to split out.
options=('!strip' '!debug')
# aarch64 users build the source package (geary-hide-sidebar) instead.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums_x86_64=('a77ea19318f3b9fe48fb4ba21860cefcab4c0de409c235044013e4ad143a6312')

package() {
    # The release tarball packs these files flat at the top level.
    install -Dm0755 "libgeary-hide-sidebar.so" \
        "$pkgdir/usr/lib/$_pkgname/libgeary-hide-sidebar.so"
    install -Dm0755 "inject.sh" \
        "$pkgdir/usr/lib/$_pkgname/inject.sh"
    install -Dm0644 "geary-hide-sidebar.hook" \
        "$pkgdir/usr/share/libalpm/hooks/$_pkgname.hook"
    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm0644 "LICENSE"   "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
