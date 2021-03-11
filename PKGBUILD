# Maintainer: esensar <es.ensar at gmail dot com>
#
pkgname="neovim-rpc-api-explorer"
pkgver=0.2.3
pkgrel=2
pkgdesc="Java application used to explore NeoVim RPC API, useful for remote plugin development"
url="https://www.ensarsarajcic.com/neovim-java"
arch=("any")
license=("MIT")
depends=("java-environment=11" "java-openjfx=11")
noextract=("api-explorer-$pkgver.jar")
source=(
	"https://github.com/esensar/neovim-java/releases/download/${pkgver}/api-explorer-${pkgver}.jar"
	"https://raw.githubusercontent.com/esensar/neovim-java/${pkgver}/LICENSE"
)
sha256sums=(
  "7cf91be1217499a0cbcc324825bf98ad39ff77bab8ffe94f0626e621f02e89cc"
  "3e7cd7b603d4a64eb5c7599ceafb5a5f4b3fca7f4666e048f16187eb8acdcc21"
)

_api_explorer_desktop="[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Type=Application
Exec=neovim-rpc-api-explorer
Name=Neovim RPC API Explorer
Comment=Explore Neovim RPC API available to remote plugins
Icon=neovim"

package() {
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "$srcdir/api-explorer-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

    printf "#!/usr/bin/env bash\nexec java -jar --module-path=\"/usr/lib/jvm/java-11-openjfx/lib\" --add-modules=\"javafx.base,javafx.controls,javafx.fxml\" /usr/share/java/$pkgname/$pkgname.jar" > "$srcdir/$pkgname"

    echo -e "$_api_explorer_desktop" | tee "$srcdir/$pkgname.desktop"

    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    chmod 775 "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
