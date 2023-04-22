# Maintainer: JianQing Liu <me at pegasis dot site>
pkgname=discord-chat-exporter-cli
pkgver=2.39.1
pkgrel=1
pkgdesc="Export message history from a Discord channel to a file"
arch=('any')
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL')
depends=('dotnet-runtime>=6')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://github.com/Tyrrrz/DiscordChatExporter/releases/download/$pkgver/DiscordChatExporter.CLI.zip"
"discord-chat-exporter-cli")
noextract=("$pkgname-$pkgver.zip")
md5sums=('f0d137269f9be151c43014ac01cadf22' 
'8077678acad67ad31578593deee8bcc6')
BUILDENV+=('!check')

prepare() {
    cd "$srcdir"
    mkdir -p "$srcdir/unzip"
    cd "$srcdir/unzip"
    unzip -q "$srcdir/$pkgname-$pkgver.zip"
    chmod 666 -R ./*
    rm "$srcdir/$pkgname-$pkgver.zip"
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt/"
    mv "$srcdir/unzip" "$pkgdir/opt/discord-chat-exporter-cli"
    install -m755 discord-chat-exporter-cli "$pkgdir/opt/discord-chat-exporter-cli/"
    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/opt/discord-chat-exporter-cli/discord-chat-exporter-cli" "$pkgdir/usr/bin/discord-chat-exporter-cli"
}
