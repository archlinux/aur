# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="archci"
pkgver="1.4.1"
pkgrel=1
pkgdesc='A script to create AppContainer Images from Arch Linux packages(Repo or Aur)'
arch=('any')
url='https://github.com/PaulAvery/archci'
license=('BSD')
depends=('bash' 'nodejs' 'pacman' 'pacaur' 'coreutils' 'rkt' 'gnupg' 'arch-install-scripts' 'sudo' 'actool-git')
makedepends=('npm' 'ronn')
source=('archci.sh' 'LICENSE' 'README.md')
sha256sums=('8a7bd6e2f056f76b4a978bd26f76a7f9e1354742a576864d6ddf32299cd75894'
            'fc49871717e45fb5a32e71dc6e8893b57efe8ace80ee6ab176920ee91482b1bd'
            '05ea6be95dd12ab4f538d3da58b91b1dc78510c4f8ed9adbd0edb48932b62db8')

package() {
	install -Dm 755 archci.sh "$pkgdir/usr/bin/archci"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/archci/BSD-3-Clause"

    # Create manpage
    ronn -r --manual=archci --organization="Florian Albertz" README.md
    install -Dm 644 README.1 "$pkgdir/usr/share/man/man1/archci.1"

	# Install sjx dependency
	mkdir -p "$pkgdir/usr/lib/archci/node_modules"
	cd "$pkgdir/usr/lib/archci"
	npm install sx
}
