# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="gourmand-bin"
pkgver="1.1.0rc2"
pkgrel="2"
pkgdesc="A manager, editor, and organizer for recipes."
url="https://github.com/GourmandRecipeManager/gourmand"
license=("GPL-2.0-only")
source=("https://github.com/GourmandRecipeManager/gourmand/releases/download/$pkgver/Gourmand-$pkgver-$CARCH.AppImage"
    "gourmand.png")
b2sums=("SKIP"
    "d42a8300b1b982676d060825ca4fad7e70591b7d712cf2147bb052caf55780cf11cfaf7dbcfdc6da9fa9a66a7ffcd2d46f6a13a40df75ca3656bae94a2f9ff98")
arch=("x86_64")
makedepends=("gendesk" "coreutils") # ("curl" "jq")
conflicts=("gourmand")
provides=("gourmand=$pkgver")
options=("!strip")

# The latest release (1.0.0) is broken.
# Automatic release versions will be used when there is a new working release > 1.1.0rc2.
# pkgver()
# {
#     releaseInformation="$(curl -sS https://api.github.com/repos/GourmandRecipeManager/gourmand/releases/latest)"
#     jq -r .tag_name <<< "$releaseInformation"
# }

prepare()
{
    gendesk -f -n --categories="Utility" --startupnotify="true"
}

package()
{
    install -Dvm755 "$srcdir"/*.AppImage "$pkgdir/usr/bin/gourmand"
    install -Dvm644 "$srcdir/gourmand.desktop" "$pkgdir/usr/share/applications/gourmand.desktop"
    install -Dvm644 "$srcdir/gourmand.png" "$pkgdir/usr/share/icons/gourmand.png"
}
