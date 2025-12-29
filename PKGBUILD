# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-optimal-model-temps
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal OpenCode plugin that hooks chat.params and nudges specific models to their preferred sampling temperature"
arch=('any')
url="https://github.com/Lyapsus/opencode-optimal-model-temps"
license=('MIT')
depends=('opencode')
options=('!strip' '!debug')
install=$pkgname.install
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('049cac4e14af603724db155692ab8eef5156f652f627eb9fa909f2946373154a')
noextract=("$pkgname-$pkgver.tgz")

latestver() {
    curl -s "https://registry.npmjs.org/$pkgname/latest" | jq -r '.version'
}

package() {
    # Extract the tarball
    mkdir -p "$srcdir/npm-extract"
    tar -xzf "$srcdir/$pkgname-$pkgver.tgz" -C "$srcdir/npm-extract"

    # The tarball usually contains a 'package' directory
    cd "$srcdir/npm-extract/package"

    # Install to plugin directory
    install -d "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname/"

    # Install license if present (it's MIT, likely in package)
    if [[ -f "LICENSE" ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
