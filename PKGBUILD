# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="archci"
pkgver="1.5.0"
pkgrel=1
pkgdesc='A script to create AppContainer Images from Arch Linux packages(Repo or Aur)'
arch=('any')
url='https://github.com/PaulAvery/archci'
license=('BSD')
depends=('fish' 'nodejs' 'pacman' 'pacaur' 'coreutils' 'rkt' 'gnupg' 'arch-install-scripts' 'sudo' 'actool-git')
makedepends=('npm' 'ronn')
source=('archci.fish' 'LICENSE' 'README.md')
sha256sums=('88b26141a330bfafc6a05381ff4b7fcaf4045fc40dc2836f04a3a0cd999f9543'
            'fc49871717e45fb5a32e71dc6e8893b57efe8ace80ee6ab176920ee91482b1bd'
            '21d07aea1b76e85dc17164fb9673e50fe53b52d198b2841881644429c209b35b')

build() {
    # Create manpage
    ronn -r --manual=archci --organization="Florian Albertz" README.md

	# Install sx dependency
	npm install sx
}

package() {
	install -Dm 755 archci.fish "$pkgdir/usr/bin/archci"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/archci/BSD-3-Clause"

    install -Dm 644 README.1 "$pkgdir/usr/share/man/man1/archci.1"

    mkdir -p "$pkgdir/usr/lib/archci"
    cp -PR node_modules "$pkgdir/usr/lib/archci"
}
