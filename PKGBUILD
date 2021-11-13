# Maintainer:  Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codelobster
pkgver=1.12.0
upstream_pkgrel=1
pkgrel=1
pkgdesc='Free cross-platform IDE for PHP/HTML/CSS/JavaScript development'
arch=('x86_64')
url="http://www.codelobster.com"
license=("custom:$pkgname")
provides=('codelobster-ide')
options=('!strip')
depends=('libxcomposite'
         'qt5-svg'
         'hicolor-icon-theme'
         'libxrandr'
         'libssh'
         'openssl-1.0'
         'qt5-webchannel'
         'qt5-location'
         'nss'
         'qt5-multimedia'
         'libxcursor')
source=("$pkgname-$pkgver.rpm::http://codelobsteride.com/download/codelobsteride-$pkgver-$upstream_pkgrel.$arch.rpm"
        'LICENSE'
        'codelobster.desktop')
sha256sums=('e5a9221271bb07bc4802a069feb5e5a0769fe01f5f5e4a409f4589f2e6a0ad59'
            '70ce1193a0036cff727f29e1c94bd3ddd61599993ba5d130491037b91158a73a'
            '8b14307b2e4432f4a89633604801dcf5dc6dc32dc4505d138397c0efe33d26f3')

package() {
        mv "$srcdir/opt" "$pkgdir"
        mkdir -p "$pkgdir/usr/share"
        mv "$srcdir/usr/share/icons" "$pkgdir/usr/share"
        find "$pkgdir/opt/${pkgname}ide/" -type f -exec chmod 755 {} +
        find "$pkgdir/usr/share/icons/hicolor/" -type f -exec chmod 644 {} +
        install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
        install -Dm644 "codelobster.desktop" -t "$pkgdir/usr/share/applications/codelobster.desktop"
        mkdir "$pkgdir/usr/bin"
        ln -s "$pkgdir/opt/codelobsteride/CodeLobsterIDE" "$pkgdir/usr/bin/codelobster"
}
