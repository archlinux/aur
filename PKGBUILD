# Maintainer: minerharry <miner.harry567@gmail.com>
pkgname=dolphin-taildrop-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r15.fbbebef
pkgrel=1
pkgdesc="Dolphin right-click menu entry to send files via tailscale taildrop"
arch=("x86_64")
url="https://github.com/idobaruch7/send-with-taildrop"
license=('GPL')
groups=()
depends=("dolphin" "tailscale" "kdialog" "python" "zip" "pv" "bash") #requires qdbus (provided by either qt5-tools or qt6-tools) but PKGBUILD doesn't have great "multiple possible dependencies". But they should be depended upon by KDE anyway, so not including them here.
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/idobaruch7/send-with-taildrop")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

        ( set -o pipefail
          git describe --long --abbrev=7 2>/dev/null ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
        )

}

package() {
	cd "$srcdir/${pkgname%-git}"
                
        #install to fakeroot home directory
        chmod +x ./scripts/install.sh
	HOME="${pkgdir}$HOME" ./scripts/install.sh

        #install license
        install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
