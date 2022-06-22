# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli-git'
_pkgname='ani-cli'
pkgver=r558.5fb1db3
pkgrel=1
pkgdesc="A cli to browse and watch anime. (development version)"
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
makedepends=('git')
provides=('ani-cli')
conflicts=('ani-cli')
source=('ani-cli::git+https://github.com/pystardust/ani-cli.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
        install -Dm755 "./bin/ani-cli" "$pkgdir/usr/bin/ani-cli"
        install -Dm755 "./lib/ani-cli/player_download" "$pkgdir/usr/lib/ani-cli/player_download"
        install -Dm755 "./lib/ani-cli/player_mpv" "$pkgdir/usr/lib/ani-cli/player_mpv"
        install -Dm755 "./lib/ani-cli/player_syncplay" "$pkgdir/usr/lib/ani-cli/player_syncplay"
        install -Dm755 "./lib/ani-cli/player_vlc" "$pkgdir/usr/lib/ani-cli/player_vlc"
        install -Dm755 "./lib/ani-cli/UI" "$pkgdir/usr/lib/ani-cli/UI"
}
