# Maintainer: buckket <felix@buckket.org>

_pkgname=gotify-server
pkgname=$_pkgname-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='A simple server for sending and receiving messages'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/gotify/server'
depends=('glibc')
license=('MIT')
provides=('gotify-server')
conflicts=('gotify-server')
backup=('etc/gotify/config.yml')
source=("https://raw.githubusercontent.com/gotify/server/v${pkgver}/config.example.yml"
        'config.patch'
        'tmpfiles.conf'
        'sysusers.conf'
        'gotify-server.service')
source_x86_64=("$url/releases/download/v${pkgver}/gotify-linux-amd64.zip")
source_armv7h=("$url/releases/download/v${pkgver}/gotify-linux-arm-7.zip")
source_aarch64=("$url/releases/download/v${pkgver}/gotify-linux-arm64.zip")
sha256sums=('d6f9716c7f67cfb518f3f50a18cbc950ef3e8e9c8ba1f226654dfdd3bf8226d4'
            'a8a511e2b98fa548391a1602fcfa05df0e10fae6f5904cbfc4202566f2dd8265'
            '14bd1a9270b089b99d9bbe8ebdd0c208c3f74c7347a792d508ffce75b0e1c641'
            '150a84f2f89d70c147cc3a2dbddb469f262ed2e8b6d3ffcb74eccb49dfdb2a24'
            '9aa04ff9a2981aa885d4f8df7467c4d7722aa12de7ae27376a4a11b559a0d1e2')
sha256sums_x86_64=('7c2bb7946580d5cc7586033e03216336b133cd57a7ad1661ab6da4915ccbdfce')
sha256sums_armv7h=('1b56be7c8793ce359b755fb96aeb2c209df8f859027e6671b0439ec830ae7a70')
sha256sums_aarch64=('ba9665812a0966b83f308e209ef6c808774e4ee98eced508a60b08e5b9929715')

prepare() {
  patch --follow-symlinks --forward -o "$srcdir/config.yml" config.example.yml config.patch
}

package() {
  install -Dm755 gotify-linux-amd64 "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/config.yml" "$pkgdir/etc/gotify/config.yml"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}
